class LabMeasurementController < ApplicationController
    def index
        @lab_measurement = TbLabMeasurement.all
        jsonResponse(@lab_measurement)
    end
    def show
        @lab_measurement = TbLabMeasurement.find(params[:id])
        jsonResponse(@lab_measurement)
    end
    def create
        @lab_measurement = TbLabMeasurement.create!(lab_measurement_params)
        jsonResponse(@lab_measurement, :created)
    end
    def update
        @lab_measurement = TbLabMeasurement.find(params[:id])
        jsonResponse(@lab_measurement.update!(lab_measurement_params), :no_content)
    end
    def destroy
        TbLabMeasurement.destroy(params[:id])
        head :no_content
    end

    private
        def lab_measurement_params
            params.permit(:name)
        end
end
