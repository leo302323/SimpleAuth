module SimpleAuth
  module CustomAuth
    # custom override authorize method
    # def authorize
    #  @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    #  @user
    # end

    # custom override authenticate method
    # def authenticate
    #   user = User.find_by(email: options[:email])
    #   user.authenticate(options[:password]) ? user : nil
    # end

    #custom override register method
    # def register
    #   user = User.create!(options)
    #   user
    # end

    # custom override confirm method
    # def confirm
    #   nil
    # end
  end
end


SimpleAuth.configure do |c|
  c.secret_key = 'your secret base key' #Rails.application.secrets.secret_key_base
  c.exp = 7.days.from_now #sign in token expiration time
  c.redis = {host: 'localhost', port: 6379}
  c.from = 'tapas-apps@dtcj.com' #confirm email address from
  c.confirm_url = 'http://localhost:3000' #confirmation api domain
end