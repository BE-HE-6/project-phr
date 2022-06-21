class TbVaccine < ApplicationRecord
    validates :name, presence: true
    validates :location, presence: true
    validates :user_id, presence: true, numericality: true
    validates :vaccine_category_id, presence: true, numericality: true
end
