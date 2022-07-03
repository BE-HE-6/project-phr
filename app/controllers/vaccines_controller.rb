class VaccinesController < ApplicationController
    before_action :authorize
    
    def index
        @vaccines = TbVaccine.withVaccineCategoryName.all
        jsonResponse(@vaccines)
    end
    def show
        @vaccine = TbVaccine.withVaccineCategoryName.find(params[:id])
        jsonResponse(@vaccine)
    end
    def create
        @vaccine = TbVaccine.create!(vaccine_params)
        jsonResponse(@vaccine, :created)
    end
    def destroy
        TbVaccine.destroy(params[:id])
        head :no_content
    end
    
    private def vaccine_params
        params.permit(:name, :location, :user_id, :vaccine_category_id)
    end
end
