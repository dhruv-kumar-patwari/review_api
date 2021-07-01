class ApplicationController < ActionController::Base
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    return @current_user = User.first if Rails.env.test?

    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
