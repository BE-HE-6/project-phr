class DocumentsController < ApplicationController
    before_action :authorize, :check_role_user
    
    def index
        @documents = TbDocument.withDocumentCategoryName.where(user_id: session[:user_id]).all
        jsonResponse(@documents)
    end
    def show
        @document = TbDocument.withDocumentCategoryName.where(user_id: session[:user_id]).find(params[:id])
        jsonResponse(@document)
    end
    def create
        @document = TbDocument.create!(document_params)
        jsonResponse(@document, :created)
    end
    def destroy
        TbDocument.where(user_id: session[:user_id]).destroy(params[:id])
        head :no_content
    end
    
    private def document_params
        default = { user_id: session[:user_id] }
        params.permit(:doc_name, :doc_upload, :user_id, :document_category_id).reverse_merge!(default)
    end
end
