class LabResultsController < ApplicationController
    before_action :authorize, :check_role_user
    
    def index
        @lab_results = TbLabResult.all
        jsonResponse(@lab_results)
    end

    def show
        @lab_result = TbLabResult.find(params[:id])
        jsonResponse(@lab_result)
    end

    def create
        @lab_result = TbLabResult.create!(lab_result_params)
        jsonResponse(@lab_result, :created)
    end

    def update
        @lab_result = TbLabResult.find(params[:id])
        jsonResponse(@lab_result.update!(lab_result_params), :no_content)
    end
    
    def destroy
        TbLabResult.destroy(params[:id])
        head :no_content
    end
    
    private def lab_result_params
        default = { user_id: session[:user_id] }
        params.permit(:name, :doc, :date_time, :user_id, :result_category_id, :result_note).reverse_merge!(default)
    end
end
