class BloodPressureCondition < ApplicationRecord
    # assocation
    has_many :blood_pressure

    # validation
    validates :name, presence: true, uniqueness: true
end
