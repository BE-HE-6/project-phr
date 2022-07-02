class TbLabResult < ApplicationRecord
    belongs_to :tb_lab_result_category, foreign_key: :lab_result_category_id

    validates :lab_name, presence: true
    validates :lab_doc, presence: true
    validates :lab_result_note, presence: true
    validates :user_id, presence: true, numericality: true
    validates :lab_result_category_id, presence: true, numericality: true
end
