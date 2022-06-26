class BloodGlucosesController < ApplicationController
  def create
    @req_data = data_body_req

    condition = ""
    if @req_data[:blood_glucose] < 140
      condition = "normal"
    elsif @req_data[:blood_glucose] >= 140 && @req_data[:blood_glucose] < 200
      condition = "indikasi prediabetes"
    else
      condition = "indikasi diabetes"
    end

    bloodGlucoseCondition = TbBloodGlucoseCondition.where(name: condition).first

    @bloodGlucose = TbBloodGlucose.create(
      blood_glucose: @req_data[:blood_glucose],
      note: @req_data[:note],
      date_time: Time.now,
      user_id: @req_data[:user_id],
      blood_glucose_condition_id: bloodGlucoseCondition.id
    )

    if (@bloodGlucose.valid?)
      render json: {
        status: 'success', 
        message: 'Data Blood Glucose Added'
      } 
    else 
      render json: {
        status: 'failed', 
        errors: @bloodGlucose.errors
      } 
    end
  end

  def destroy
    begin
      @bloodGlucose = TbBloodGlucose.find(params[:id])
      @bloodGlucose.destroy
      if (@bloodGlucose.valid?)
        render json: {
          status: 'success', 
          data: 'data success be deleted'
        } 
      else
        render json: {
          status: 'failed', 
          errors: @bloodGlucose.errors
        } 
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        status: 'failed', 
        errors: 'record not found'
      } 
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
        errors: 'record not found'
      } 
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
    params.require(:data).permit(:blood_glucose, :note, :user_id)
  end
end
