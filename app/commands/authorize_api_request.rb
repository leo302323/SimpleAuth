require 'simple_command'
class AuthorizeApiRequest
  prepend SimpleCommand
  prepend SimpleAuth::CustomAuth

  def initialize(headers = {})
    @headers = headers
  end

  def call
    authorize
  end

  protected

  attr_reader :headers

  def authorize
    nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= SimpleAuth::JsonWebToken.decode(auth_token)
  end

  def auth_token
    raise SimpleAuth::NoAuthTokenError if headers['Authorization'].blank?
    headers['Authorization'].split(' ').last
  end
end
