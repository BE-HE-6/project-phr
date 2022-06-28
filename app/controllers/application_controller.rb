class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery with: :null_session
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end
end
