class BloodPressureController < ApplicationController
    before_action :authorize, :check_role_user
    
    def index
        @bp = BloodPressure.where(user_id: session[:user_id]).all
        jsonResponse(@bp)
    end

    def show
        @bp = BloodPressure.where(user_id: session[:user_id]).find(params[:id])
        jsonResponse(@bp)
    end

    def create
        @bp = BloodPressure.create!(bp_params)
        jsonResponse(@bp, :created)
    end

    def destroy
        @bp = BloodPressure.where(user_id: session[:user_id]).find(params[:id]).destroy!
        head :no_content
    end

    private def bp_params
        default = { user_id: session[:user_id] }
        params.permit(:user_id, :blood_pressure_condition_id, :sistole, :diastole, :pulse, :note, :date_time).reverse_merge!(default)
    end
    
end
