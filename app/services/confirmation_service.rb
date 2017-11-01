class ConfirmationService
  attr_accessor :email
  def initialize(email)
    @email = email
  end

  def send_email
    mailer = ConfirmationMailer.send_confirmation(token, email)
    mailer.deliver_later
  end

  def valid_token?(token)
    redis_auth = Redis::Namespace.new(
        'SimpleAuth',
        redis: Redis.new(SimpleAuth.configuration.redis)
    )
    key = "confirm:#{email}"
    redis_auth.exists(key) ? redis_auth.get(key) == token : false
  end

  protected

  def token
    redis_auth = Redis::Namespace.new(
        'SimpleAuth',
        redis: Redis.new(SimpleAuth.configuration.redis)
    )
    token = SecureRandom.random_number(('9' * 12).to_i).to_s.rjust(12, '0')
    key = "confirm:#{email}"
    redis_auth.set(key, token)
    redis_auth.expire(key, 3600)
    token
  end
end