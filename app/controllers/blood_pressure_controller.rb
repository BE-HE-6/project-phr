class BloodPressureController < ApplicationController
    before_action :authorize
    
    def index
        @bp = BloodPressure.all
        jsonResponse(@bp)
    end

    def show
        @bp = BloodPressure.find(params[:id])
        jsonResponse(@bp)
    end

    def create
        @bp = BloodPressure.create!(bp_params)
        jsonResponse(@bp, :created)
    end

    def destroy
        @bp = BloodPressure.find(params[:id]).destroy!
        head :no_content
    end

    private
    def bp_params
        params.permit(:user_id, :blood_pressure_condition_id, :sistole, :diastole, :pulse, :note, :date_time)
    end
    
end
