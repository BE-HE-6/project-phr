class Api::ProfilesController < ApplicationController
  before_action :authorize
  before_action :set_profile, only: [:show, :update]

  # GET api/profile/1
  def show
    render json: @profile
  end

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
    params.require(:profile).permit(:name, :birth_place, :birth_date, :blood_type, :bpjs_id, :ktp_id)
  end
end