class TbBloodGlucoseCondition < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
