class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery with: :null_session
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:notice] = "Sorry, You Are Not Authorized To Do This"
    redirect_to(request.referrer || root_path)
  end
end
