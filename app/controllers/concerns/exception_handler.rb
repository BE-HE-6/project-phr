module ExceptionHandler
    # provides the more graceful `included` method
    extend ActiveSupport::Concern
    included do
        rescue_from ActiveRecord::RecordNotFound do |e|
            jsonResponse({ message: e.message }, :not_found)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
            jsonResponse({ message: e.message }, :unprocessable_entity)
        end
    end
end