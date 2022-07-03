class BodyWeightHeightController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        # @bwh = BodyWeightHeight.paginate(page: params[:page], per_page: 10)
        # jsonResponse(
        #     page: params[:page],
        #     total_pages: @bwh.total_pages,
        #     data: @bwh
        # )
        @bwh = BodyWeightHeight.all
        jsonResponse(@bwh)
    end

    def show
        @bwh = BodyWeightHeight.find(params[:id])
        jsonResponse(@bwh)
    end

    def create
        @bwh = BodyWeightHeight.create!(bwh_params)
        jsonResponse(@bwh, :created)
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
