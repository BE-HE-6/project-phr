class BloodOxygensController < ApplicationController
  before_action :authorize
  
  def create
    req_data = data_body_req

    @bloodOxygen = TbBloodOxygen.create(
      blood_oxygen: req_data[:blood_oxygen],
      note: req_data[:note],
      date_time: Time.now,
      user_id: req_data[:user_id],
      blood_oxygen_condition_id: req_data[:blood_oxygen_condition_id]
    )

    if (@bloodOxygen.valid?)
      render json: {
        status: 'success', 
        message: 'Data Blood Oxygen Added'
      }, status: :created 
    else 
      render json: {
        status: 'failed', 
        errors: @bloodOxygen.errors
      }, status: :unprocessable_entity 
    end

  end

  def destroy
    begin
      @bloodOxygen = TbBloodOxygen.find(params[:id])
      @bloodOxygen.destroy
      if (@bloodOxygen.valid?)
        render json: {
          status: 'success', 
          message: 'data success be deleted'
        }, status: :no_content 
      else
        render json: {
          status: 'failed', 
          errors: @bloodOxygen.errors
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
      @bloodOxygen = TbBloodOxygen.joins(:tb_blood_oxygen_condition).select("tb_blood_oxygens.id, blood_oxygen, note, date_time, user_id, name").find(params[:id])
      render json: {
        status: 'success', 
        data: @bloodOxygen
      } 
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        status: 'failed', 
        message: 'data not found'
      }, status: :not_found 
    end
  end

  def index
    @bloodOxygen = TbBloodOxygen.joins(:tb_blood_oxygen_condition)
    render json: {
      status: 'success',
      data: @bloodOxygen.all.select("tb_blood_oxygens.id, blood_oxygen, note, date_time, user_id, name")
    }
  end

  private
  def data_body_req
    params.require(:data).permit(:blood_oxygen, :note, :user_id, :blood_oxygen_condition_id)
  end
end
