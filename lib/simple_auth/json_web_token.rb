# frozen_string_literal: true
require 'jwt'

module SimpleAuth
  module JsonWebToken
    def self.encode(payload)
      payload[:exp] = SimpleAuth.configuration.exp || 7.days.from_now
      secret_key = SimpleAuth.configuration.secret_key
      JWT.encode(payload, secret_key)
    end

    def self.decode(token)
      secret_key = SimpleAuth.configuration.secret_key
      body = JWT.decode(token, secret_key)[0]
      HashWithIndifferentAccess.new(body)
    rescue StandardError => e
      if e.is_a?(JWT::ExpiredSignature)
        raise SimpleAuth::ExpirationError
      else
        raise SimpleAuth::InvalidTokenError
      end
    end
  end
end