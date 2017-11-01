require 'simple_command'
class AuthenticateRequest
  prepend SimpleCommand
  prepend SimpleAuth::CustomAuth

  def initialize(options = {})
    @options = options
  end

  def call
    authenticate
  end

  protected

  attr_reader :payload, :options

  def authenticate
    nil
  end
end