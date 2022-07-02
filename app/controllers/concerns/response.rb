module Response
    def jsonResponse(object, status = :ok)
        render json: object, status: status
    end
end