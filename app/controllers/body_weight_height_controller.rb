class BodyWeightHeightController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @bwh = BodyWeightHeight.all
        render json: { status: :success, message: 'loaded body weight height data', data: @bwh }
    end

    def show
        @bwh = BodyWeightHeight.find(params[:id])
        render json: { status: :success, message: 'loaded the specific weight and height data', data: @bwh }
    end

    def create
        @bwh = BodyWeightHeight.create!(bwh_params)
        if @bwh.save
            render status: :created, json: {
                message: "Body Weight and Height has successfully been added.",
                data: @bwh
            }
        else 
            render json: @bwh.errors, status: :unprocessable_entity
        end
        
    end

    def destroy
        BodyWeightHeight.find(params[:id]).destroy!
        head :no_content
    end
    private
    def bwh_params
        params.permit(:user_id, :weight, :height, :note, :bmi_calculation, :date_time)
    end    

end
