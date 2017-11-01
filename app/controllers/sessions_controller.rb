class SessionsController < ApplicationController
  skip_before_action :authenticate_request

  def create
    command = ::AuthenticateRequest.call(params)
    render json: command.result, status: :ok
  end
end