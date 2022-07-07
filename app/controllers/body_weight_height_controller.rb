class BodyWeightHeightController < ApplicationController
    before_action :authorize, :check_role_user
    skip_before_action :verify_authenticity_token

    def index
        @bwh = BodyWeightHeight.all.where(user_id: session[:user_id])
        jsonResponse(@bwh)
    end

    def show
        @bwh = BodyWeightHeight.where(user_id: session[:user_id]).find(params[:id])
        jsonResponse(@bwh)
    end

    def create
        @bwh = BodyWeightHeight.create!(bwh_params)
        @bwh.bmi_calculation = (@bwh.weight) / ((@bwh.height / 100) * (@bwh.height / 100))
        puts @bwh.bmi_calculation
        @bwh.save
        jsonResponse(@bwh, :created)
    end

    def destroy
        BodyWeightHeight.where(user_id: session[:user_id]).find(params[:id]).destroy!
        head :no_content
    end

    private
    def bwh_params
        default = { user_id: session[:user_id] }
        params.permit(:user_id, :weight, :height, :note, :bmi_calculation, :date_time).reverse_merge!(default)
    end  
end
