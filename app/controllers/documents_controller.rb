class DocumentsController < ApplicationController
    def index
        @document_categories = TbDocument.withDocumentCategoryName.all
        jsonResponse(@document_categories)
    end
    def show
        @document_category = TbDocument.withDocumentCategoryName.find(params[:id])
        jsonResponse(@document_category)
    end
end
