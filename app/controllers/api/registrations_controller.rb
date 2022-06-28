class Api::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # POST '/api/sign_up'
  def create
    @user = User.create(user_params)

    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: @token }, status: :created
    else
      render json: @user, status: :unprocessable_entity
    end

  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :birth_place, :birth_date, :blood_type, :bpjs_id, :ktp_id)
  end
end
