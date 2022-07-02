class LabResultCategoriesController < ApplicationController
    def index
        @lab_result_categories = TbLabResultCategory.all
        jsonResponse(@lab_result_categories)
    end
    def show
        @lab_result_category = TbLabResultCategory.find(params[:id])
        jsonResponse(@lab_result_category)
    end
    def create
        @lab_result_category = TbLabResultCategory.create!(lab_result_category_params)
        jsonResponse(@lab_result_category, :created)
    end
    def update
        @lab_result_category = TbLabResultCategory.find(params[:id])
        jsonResponse(@lab_result_category.update!(lab_result_category_params), :no_content)
    end
    def destroy
        TbLabResultCategory.destroy(params[:id])
        head :no_content
    end

    private
        def lab_result_category_params
            params.permit(:name)
        end
end
