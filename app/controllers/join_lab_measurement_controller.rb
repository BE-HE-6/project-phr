class JoinLabMeasurementController < ApplicationController
    def index
        @join_lab_measurement = TbJoinLabMeasurement.all
        jsonResponse(@join_lab_measurement)
    end
    def show
        @join_lab_measurement = TbJoinLabMeasurement.find(params[:id])
        jsonResponse(@join_lab_measurement)
    end
    def create
        @join_lab_measurement = TbJoinLabMeasurement.create!(join_lab_measurement_params)
        jsonResponse(@join_lab_measurement, :created)
    end

    private
        def join_lab_measurement_params
            params.permit(:value, :lab_measurement_id, :lab_result_id, :lab_result_tb_user_id, :lab_result_tb_lab_result_category_id)
        end
end
