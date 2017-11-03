# frozen_string_literal: true
require 'jwt'

module SimpleAuth
  module JsonWebToken
    def self.encode(payload)
      payload[:exp] = SimpleAuth.configuration.exp.to_i || 7.days.from_now.to_i
      secret_key = SimpleAuth.configuration.secret_key
      JWT.encode(payload, secret_key, 'HS256')
    end

    def self.decode(token)
      secret_key = SimpleAuth.configuration.secret_key
      body = JWT.decode(token, secret_key, true, algorithm: 'HS256')[0]
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