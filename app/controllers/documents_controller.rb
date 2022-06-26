class DocumentsController < ApplicationController
    def index
        @documents = TbDocument.withDocumentCategoryName.all
        jsonResponse(@documents)
    end
    def show
        @document = TbDocument.withDocumentCategoryName.find(params[:id])
        jsonResponse(@document)
    end
    def create
        @document = TbDocument.create!(document_params)
        jsonResponse(@document, :created)
    end
    def destroy
        TbDocument.destroy(params[:id])
        head :no_content
    end
    
    private
        def document_params
            params.permit(:doc_name, :doc_upload, :user_id, :document_category_id)
        end
end
