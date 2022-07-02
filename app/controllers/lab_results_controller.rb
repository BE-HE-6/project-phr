class LabResultsController < ApplicationController
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
    # def update
    #     @lab_result = TbLabResult.find(params[:id])
    #     jsonResponse(@lab_result.update!(lab_result_params), :no_content)
    # end
    def destroy
        TbLabResult.destroy(params[:id])
        head :no_content
    end

    private
        def lab_result_params
            params.permit(:lab_name, :lab_doc, :lab_result_note, :user_id, :lab_result_category_id)
        end
end
