class BloodGlucoseConditionsController < ApplicationController
  def create
    @blood_glucose_condition = TbBloodGlucoseCondition.create(post_param)
    if (@blood_glucose_condition.valid?)
      render json: {
        status: 'success', 
        message: 'Data Blood Glucose Condition Added'
      }, status: :created 
    else 
      render json: {
        status: 'failed', 
        message: @blood_glucose_condition.errors,
      }, status: :unprocessable_entity
    end
  end

  def update
    begin
      @blood_glucose_condition = TbBloodGlucoseCondition.find(params[:id])
      @blood_glucose_condition.update(post_param)
      if( @blood_glucose_condition.valid?)
        render json: {
          status: 'success', 
          message: 'Data Blood Glucose Condition updated'
        }, status: :no_content 
      else
        render json: {
          status: 'failed', 
          message: @blood_glucose_condition.errors,
        }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e 
      render json: {
        status: 'failed', 
        message: 'data not found'
      }, status: :not_found
    end
  end

  def destroy
    begin
      @blood_glucose_condition = TbBloodGlucoseCondition.find(params[:id])
      @blood_glucose_condition.destroy
      render json: {
        status: 'success', 
        message: 'data success be deleted'
      }, status: :no_content 
    rescue ActiveRecord::RecordNotFound => e  
      render json: {
        status: 'failed', 
        message: 'data not found'
      }, status: :not_found
    end
  end

  def index
    @blood_glucose_conditions = TbBloodGlucoseCondition.all
    render json: {
      status: 'success',
      data: @blood_glucose_conditions
    }
  end

  # def show
  #   @blood_oxygen_condition = TbBloodOxygenCondition.find(params[:id])
  #   render json: {
  #     status: 'success', 
  #     data: @blood_oxygen_conditions
  #   } 
  # end

  private
  def post_param
    params.require(:blood_glucose_condition).permit(:name)
  end
end
