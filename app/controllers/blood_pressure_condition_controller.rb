class BloodPressureConditionController < ApplicationController
    before_action :authorize
    before_action :check_role_admin

    def index
        @bpc = BloodPressureCondition.all
        jsonResponse(@bpc)
    end

    def show
        @bpc = BloodPressureCondition.find(params[:id])
        jsonResponse(@bpc)
    end

    def create
        @bpc = BloodPressureCondition.create!(bpc_params)
        jsonResponse(@bpc, :created)    
    end

    def update
        @bpc = BloodPressureCondition.find(params[:id])
        jsonResponse(@bpc.update!(bpc_params), :no_content)
    end

    def destroy
        @bpc = BloodPressureCondition.find(params[:id]).destroy!
        head :no_content
    end

    private
    def bpc_params
        params.permit(:name)
    end
    
end
