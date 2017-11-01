# frozen_string_literal: true
class ConfirmationMailer < ApplicationMailer
  default from: SimpleAuth.configuration.from

  def send_confirmation(token, email)
    @token = token
    params = { email: email, token: token }
    @confirmation_url = "#{SimpleAuth.configuration.confirm_url}?#{params.to_query}"
    mail(to: email, subject: '用户邮箱确认')
  end
end