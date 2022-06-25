class TbDocument < ApplicationRecord    
    belongs_to :tb_document_category, foreign_key: :document_category_id

    validates :name, presence: true
    validates :location, presence: true
    validates :user_id, presence: true, numericality: true
    validates :document_category_id, presence: true, numericality: true
end
