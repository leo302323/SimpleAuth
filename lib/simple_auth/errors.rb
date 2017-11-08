module SimpleAuth
  class NoAuthTokenError < StandardError
    def message
      'lacking of token in header with Authorization key'
    end
  end

  class ExpirationError < StandardError
    def message
      'token expired'
    end
  end

  class InvalidTokenError < StandardError
    def message
      'invalid token'
    end
  end

  class ConfirmTokenError < StandardError
    def message
      '无效的token或token已过期，请重新注册'
    end
  end
end