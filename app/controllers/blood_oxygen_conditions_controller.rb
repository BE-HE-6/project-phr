class BloodOxygenConditionsController < ApplicationController
  def create
    @blood_oxygen_condition = TbBloodOxygenCondition.create(post_param)
    if (@blood_oxygen_condition.valid?)
      render json: {
        status: 'success', 
        message: 'Data Blood Oxygen Condition Added'
      }, status: :created 
    else 
      render json: {
        status: 'failed', 
        message: @blood_oxygen_condition.errors,
      }, status: :unprocessable_entity
    end
  end

  def update
    begin
      @blood_oxygen_condition = TbBloodOxygenCondition.find(params[:id])
      @blood_oxygen_condition.update(post_param)
      if( @blood_oxygen_condition.valid?)
        render json: {
          status: 'success', 
          message: 'Data Blood Oxygen Condition updated'
        }, status: :no_content 
      else
        render json: {
          status: 'failed', 
          message: @blood_oxygen_condition.errors,
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
      @blood_oxygen_condition = TbBloodOxygenCondition.find(params[:id])
      @blood_oxygen_condition.destroy
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
    @blood_oxygen_conditions = TbBloodOxygenCondition.all
    render json: {
      status: 'success',
      data: @blood_oxygen_conditions
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
    params.require(:blood_oxygen_condition).permit(:name)
  end
end
