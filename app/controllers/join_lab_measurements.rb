class JoinLabMeasurementsController < ApplicationController
    before_action :authorize, :check_role_user
    
    def index
        join_lab_measurements = TbJoinLabMeasurement.all
        jsonResponse(join_lab_measurements)
    end
    def show
        join_lab_measurement = TbJoinLabMeasurement.find(params[:id])
        jsonResponse(join_lab_measurement)
    end
    def create
        join_lab_measurement = TbJoinLabMeasurement.create!(join_lab_measurement_params)
        jsonResponse(join_lab_measurement, :created)
    end
    def update
        join_lab_measurement = TbJoinLabMeasurement.find(params[:id])
        jsonResponse(join_lab_measurement.update!(join_lab_measurement_params), :no_content)
    end
    def destroy
        TbJoinLabMeasurement.destroy(params[:id])
        head :no_content
    end
    
    private def join_lab_measurement_params
        params.permit(:value, :result_id, :measurement_id)
    end
end
