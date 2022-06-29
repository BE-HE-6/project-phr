class BloodPressureCondition < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
