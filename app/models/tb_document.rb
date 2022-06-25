class TbDocument < ApplicationRecord    
    belongs_to :tb_document_category, foreign_key: :document_category_id

    validates :doc_name, presence: true
    validates :doc_upload, presence: true
    validates :user_id, presence: true, numericality: true
    validates :document_category_id, presence: true, numericality: true
end
