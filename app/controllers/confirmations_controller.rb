class ConfirmationsController < ApplicationController
  skip_before_action :authenticate_request
  before_action :validate_token

  def update
    command = ::ConfirmRequest.call(confirm_params)
    render json: command.result
  end

  private

  def validate_token
    return if ConfirmationService.new(params[:email]).valid_token?(confirm_params[:token])
    raise '无效的token或token已过期，请重新注册'
  end

  def confirm_params
    params.permit(:email, :token)
  end
end
