class BloodPressure < ApplicationRecord
    belongs_to :blood_pressure_condition, foreign_key: "blood_pressure_condition_id"

    validates :user_id, presence: true, numericality: true
    validates :blood_pressure_condition_id, presence: true, numericality: true
    validates :sistole, presence: true, numericality: { only_integer: true }
    validates :diastole, presence: true, numericality: { only_integer: true }
    validates :pulse, presence: true, numericality: { only_integer: true }
    validates :date_time, presence: true
end
