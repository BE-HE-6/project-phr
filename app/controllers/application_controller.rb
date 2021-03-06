class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

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
      session[:current_user_role] = @user.role
    end
  end

  def authorize
    render json: { message: 'You have to log in' }, status: :unauthorized unless authorized_user
  end
  def check_role_admin
    if session[:current_user_role] == 'user'
      render json: { message: "You don't have permission" }, status: :unauthorized 
    end
  end

  def check_role_user
    if session[:current_user_role] == 'admin'
      render json: { message: "You don't have permission"}, status: :unauthorized
    else
      session[:user_id] = @user.id
    end
  end

end
