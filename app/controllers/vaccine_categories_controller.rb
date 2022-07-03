class VaccineCategoriesController < ApplicationController
    def index
        @vaccine_categories = TbVaccineCategory.all
        jsonResponse(@vaccine_categories)
    end
    def show
        @vaccine_category = TbVaccineCategory.find(params[:id])
        jsonResponse(@vaccine_category)
    end
    def create
        @vaccine_category = TbVaccineCategory.create!(vaccine_category_params)
        jsonResponse(@vaccine_category, :created)
    end
    def update
        @vaccine_category = TbVaccineCategory.find(params[:id])
        jsonResponse(@vaccine_category.update!(vaccine_category_params), :no_content)
    end
    def destroy
        TbVaccineCategory.destroy(params[:id])
        head :no_content
    end
    
    private
        def vaccine_category_params
            params.permit(:name)
        end
end
