class TbVaccine < ApplicationRecord
    belongs_to :tb_vaccine_category, foreign_key: :vaccine_category_id
    belongs_to :user

    validates :name, presence: true
    validates :location, presence: true
    validates :user_id, presence: true, numericality: true
    validates :vaccine_category_id, presence: true, numericality: true

    scope :withVaccineCategoryName, -> { 
        select('tb_vaccines.*, tb_vaccine_categories.name as vaccine_category_name')
        .joins(:tb_vaccine_category) 
    }
end
