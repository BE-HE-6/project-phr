class BloodOxygenConditionsController < ApplicationController
  def create
    @blood_oxygen_condition = TbBloodOxygenCondition.create(post_param)
    if (@blood_oxygen_condition.valid?)
      render json: {
        status: 'success', 
        message: 'Data Blood Oxygen Condition Added'
      } 
    else 
      render json: {
        status: 'failed', 
        message: @blood_oxygen_condition.errors
      } 
    end
  end

  def update
    @blood_oxygen_condition = TbBloodOxygenCondition.find(params[:id])
    @blood_oxygen_condition.update(post_param)
    render json: {
      status: 'success', 
      message: 'Data Blood Oxygen Condition updated'
    } 
  end

  def destroy
  end

  def index
    @blood_oxygen_conditions = TbBloodOxygenCondition.all
    render json: {
      status: 'success',
      data: @blood_oxygen_conditions
    }
  end

  private
  def post_param
    params.require(:blood_oxygen_condition).permit(:name)
  end
end
