class BloodGlucosesController < ApplicationController
  before_action :authorize
  # before_action :check_role_user

  def create
    req_data = data_body_req

    @bloodGlucose = TbBloodGlucose.create(
      blood_glucose: req_data[:blood_glucose],
      note: req_data[:note],
      date_time: Time.now,
      user_id: req_data[:user_id],
      blood_glucose_condition_id: req_data[:blood_glucose_condition_id]
    )

    if (@bloodGlucose.valid?)
      render json: {
        status: 'success', 
        message: 'Data Blood Glucose Added'
      }, status: :created 
    else 
      render json: {
        status: 'failed', 
        errors: @bloodGlucose.errors
      }, status: :unprocessable_entity 
    end

  end

  def destroy
    begin
      @bloodGlucose = TbBloodGlucose.find(params[:id])
      @bloodGlucose.destroy
      if (@bloodGlucose.valid?)
        render json: {
          status: 'success', 
          message: 'data success be deleted'
        }, status: :no_content 
      else
        render json: {
          status: 'failed', 
          errors: @bloodGlucose.errors
        } 
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        status: 'failed', 
        message: 'data not found'
      }, status: :not_found 
    end
  end

  def show
    begin
      @bloodGlucose = TbBloodGlucose.joins(:tb_blood_glucose_condition).select("tb_blood_glucoses.id, blood_glucose, note, date_time, user_id, name").find(params[:id])
      render json: {
        status: 'success', 
        data: @bloodGlucose
      } 
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        status: 'failed', 
        message: 'data not found'
      }, status: :not_found 
    end
  end

  def index
    @bloodGlucose = TbBloodGlucose.joins(:tb_blood_glucose_condition)
    render json: {
      status: 'success',
      data: @bloodGlucose.all.select("tb_blood_glucoses.id, blood_glucose, note, date_time, user_id, name")
    }
  end

  private
  def data_body_req
    params.require(:data).permit(:blood_glucose, :note, :user_id, :blood_glucose_condition_id)
  end
end
