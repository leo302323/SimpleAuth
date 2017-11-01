class RegistrationsController < ApplicationController
  skip_before_action :authenticate_request
  after_action :send_confirmation_email, only: [:create]

  def create
    @command = ::RegisterRequest.call(params)
    render json: @command.result, status: :ok
  end

  protected

  def send_confirmation_email
    ConfirmationService.new(@command.result.email).send_email if SimpleAuth.configuration.send_confirm_email
  end
end