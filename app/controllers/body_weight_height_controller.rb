class BodyWeightHeightController < ApplicationController
    before_action :authorize, :check_role_user
    skip_before_action :verify_authenticity_token

    def index
        session[:user_id] = @user.id
        @bwh = BodyWeightHeight.all.where(user_id: session[:user_id])
        jsonResponse(@bwh)
    end

    def show
        session[:user_id] = @user.id
        @bwh = BodyWeightHeight.where(user_id: session[:user_id]).find(params[:id])
        jsonResponse(@bwh)
    end

    def create
        session[:user_id] = @user.id
        @bwh = BodyWeightHeight.create(bwh_params)
        @bwh.user_id = session[:user_id]
        @bwh.bmi_calculation = @bwh.weight/((@bwh.height/100)*(@bwh.height/100))
        @bwh.save
        jsonResponse(@bwh, :created)
    end

    def destroy
        session[:user_id] = @user.id
        BodyWeightHeight..where(user_id: session[:user_id]).find(params[:id]).destroy!
        head :no_content
    end

    private
    def bwh_params
        params.permit(:user_id, :weight, :height, :note, :bmi_calculation, :date_time)
    end  
end
