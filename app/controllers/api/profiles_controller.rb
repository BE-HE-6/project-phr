class Api::ProfilesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize
  before_action :set_profile, only: [:show, :update]

  # GET api/profiles/:id
  def show
    session[:user_id] = @user.id
    @profile = User.where(id: session[:user_id])
    render json: @profile
  end

  # PUT api/profiles/:id
  def update
    if @profile.update(profile_params)
      render json: @profile, status: :ok
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:email, :password, :name, :birth_place, :birth_date, :blood_type, :bpjs_id, :ktp_id)
  end
end
