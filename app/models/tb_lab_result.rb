class TbLabResult < ApplicationRecord
    validates :lab_name, presence: true
    validates :lab_doc, presence: true
    validates :lab_result_note, presence: true
    validates :user_id, presence: true, numericality: true
    validates :lab_result_category_id, presence: true, numericality: true
end
