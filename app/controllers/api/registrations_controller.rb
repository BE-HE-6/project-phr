class Api::RegistrationsController < ApplicationController
  # POST '/api/sign_up'
  def create
    @user = User.create(user_params)

    if @user.valid?
      render json: @user, status: :created
    else
      render json: @user, status: :unprocessable_entity
    end

  end

  private
  def user_params
    params.permit( :email, :password, :name, :birth_place, :birth_date, :blood_type, :bpjs_id, :ktp_id)
  end
end
