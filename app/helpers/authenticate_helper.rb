module AuthenticateHelper
  extend ActiveSupport::Concern

  included do
    attr_reader :current_user
    before_action :authenticate_request
  end

  def authenticate_request
    @current_user = ::AuthorizeApiRequest.call(request.headers).result
  end
end