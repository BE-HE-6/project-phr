class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  #POST 'api/sign_in'
  def login
    @email = params[:email]
    @password = params[:password]

    @user = User.find_by(email: @email)
    if @user && @user.authenticate(@password)
      @token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: @token }, status: :ok
    else
      render json: @user, status: :unprocessable_entity
    end
  end
end
