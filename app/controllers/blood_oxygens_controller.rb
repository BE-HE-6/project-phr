class BloodOxygensController < ApplicationController
  def create
    @req_data = data_body_req

    condition = ""
    if @req_data[:blood_oxygen].to_i >= 95
      condition = "normal"
    elsif @req_data[:blood_oxygen].to_i >= 91 && @req_data[:blood_oxygen].to_i < 95
      condition = "normal batas bawah"
    elsif @req_data[:blood_oxygen].to_i >= 70 && @req_data[:blood_oxygen].to_i < 91
      condition = "rendah"
    else 
      condition = "bahaya"
    end

    bloodOxygenCondition = TbBloodOxygenCondition.where(name: condition).first

    @bloodOxygen = TbBloodOxygen.create(
      blood_oxygen: @req_data[:blood_oxygen],
      note: @req_data[:note],
      date_time: Time.now,
      user_id: @req_data[:user_id],
      blood_oxygen_condition_id: bloodOxygenCondition.id
    )

    if (@bloodOxygen.valid?)
      render json: {
        status: 'success', 
        message: 'Data Blood Oxygen Added'
      } 
    else 
      render json: {
        status: 'failed', 
        errors: @bloodOxygen.errors
      } 
    end

  end

  def destroy
    begin
      @bloodOxygen = TbBloodOxygen.find(params[:id])
      @bloodOxygen.destroy
      if (@bloodOxygen.valid?)
        render json: {
          status: 'success', 
          data: 'data success be deleted'
        } 
      else
        render json: {
          status: 'failed', 
          errors: @bloodOxygen.errors
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
      @bloodOxygen = TbBloodOxygen.joins(:tb_blood_oxygen_condition).select("tb_blood_oxygens.id, blood_oxygen, note, date_time, user_id, name").find(params[:id])
      render json: {
        status: 'success', 
        data: @bloodOxygen
      } 
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        status: 'failed', 
        errors: 'record not found'
      } 
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
    params.require(:data).permit(:blood_oxygen, :note, :user_id)
  end
end
