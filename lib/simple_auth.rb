require "simple_auth/engine"
require 'simple_command'
require 'simple_auth/errors'
require 'simple_auth/json_web_token'
require 'redis-namespace'
require 'redis'

module SimpleAuth
  # Your code goes here...
  module CustomAuth
    def authorize; end
    def authenticate; end
  end

  class Configuration
    attr_accessor :secret_key, :exp, :redis, :from, :confirm_url, :send_confirm_email
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.generate_token(payload)
    token = JsonWebToken.encode(payload)
    token
  end
end
