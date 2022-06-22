class DocumentCategoriesController < ApplicationController
    def index
        @document_categories = TbDocumentCategory.all
        jsonResponse(@document_categories)
    end
    def show
        @document_category = TbDocumentCategory.find(params[:id])
        jsonResponse(@document_category)
    end
    def create
        @document_category = TbDocumentCategory.create!(document_category_params)
        jsonResponse(@document_category, :created)
    end
    def update
        @document_category = TbDocumentCategory.find(params[:id])
        jsonResponse(@document_category.update!(document_category_params), :no_content)
    end
    def destroy
        TbDocumentCategory.destroy(params[:id])
        head :no_content
    end
    
    private
        def document_category_params
            params.permit(:name)
        end
end
