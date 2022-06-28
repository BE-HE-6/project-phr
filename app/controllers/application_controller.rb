class ApplicationController < ActionController::Base
    # branch FT-4.1
    protect_from_forgery with: :null_session
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

    private
    def not_destroyed(e)
        render json: {errors: e.record.errors}, status: :unprocessable_entitys
    end
end
