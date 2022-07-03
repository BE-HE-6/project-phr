class VaccinesController < ApplicationController
    def index
        @vaccines = TbVaccine.all
        jsonResponse(@vaccines)
    end
    def show
        @vaccine = TbVaccine.find(params[:id])
        jsonResponse(@vaccine)
    end
    def create
        @vaccine = TbVaccine.create!(vaccine_params)
        jsonResponse(@vaccine, :created)
    end
    # def update
    #     @vaccine = TbVaccine.find(params[:id])
    #     jsonResponse(@vaccine.update!(vaccine_params), :no_content)
    # end
    def destroy
        TbVaccine.destroy(params[:id])
        head :no_content
    end
    
    private
        def vaccine_params
            params.permit(:name, :location, :user_id, :vaccine_category_id)
        end
end
