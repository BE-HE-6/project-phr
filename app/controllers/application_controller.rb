class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery with: :null_session
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token
    # Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMzY5In0.5JuT54p4oa1hDNejn_CCcNI-2IbK0v4dsx32s3EWwUU

    @auth_header = request.headers['Authorization']
    if @auth_header
      @token = @auth_header.split(' ')[1]
      begin
        JWT.decode(@token, 'secret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authorized_user
    @decoded_token = decode_token
    if @decoded_token
      @user_id = @decoded_token[0]['user_id']
      @user = User.find_by(id: @user_id)
    end
  end

  def authorize
    render json: { message: 'You have to log in' }, status: :unauthorized unless authorized_user
  end

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
