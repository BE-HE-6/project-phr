class VaccinesController < ApplicationController
    before_action :authorize, :check_role_user
    
    def index
        @vaccines = TbVaccine.withVaccineCategoryName.where(user_id: session[:user_id]).all
        jsonResponse(@vaccines)
    end
    def show
        @vaccine = TbVaccine.withVaccineCategoryName.where(user_id: session[:user_id]).find(params[:id])
        jsonResponse(@vaccine)
    end
    def create
        @vaccine = TbVaccine.create!(vaccine_params)
        jsonResponse(@vaccine, :created)
    end
    def destroy
        TbVaccine.where(user_id: session[:user_id]).destroy(params[:id])
        head :no_content
    end
    
    private def vaccine_params
        default = { user_id: session[:user_id] }
        params.permit(:name, :location, :user_id, :vaccine_category_id).reverse_merge!(default)
    end
end
