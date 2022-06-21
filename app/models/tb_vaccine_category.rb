class TbVaccineCategory < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
