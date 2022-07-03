class TbVaccine < ApplicationRecord
    belongs_to :tb_vaccine_category, foreign_key: :vaccine_category_id

    validates :name, presence: true
    validates :location, presence: true
    validates :user_id, presence: true, numericality: true
    validates :vaccine_category_id, presence: true, numericality: true
end
