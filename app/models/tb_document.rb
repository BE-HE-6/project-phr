class TbDocument < ApplicationRecord    
    belongs_to :tb_document_category, foreign_key: :document_category_id
    belongs_to :user

    mount_uploader :doc_upload, DocUploadUploader

    validates :doc_name, presence: true
    validates :doc_upload, presence: true
    validates :user_id, presence: true, numericality: true
    validates :document_category_id, presence: true, numericality: true

    scope :withDocumentCategoryName, -> { 
        select('tb_documents.*, tb_document_categories.name as document_category_name')
        .joins(:tb_document_category) 
    }
end
