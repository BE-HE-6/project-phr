class BloodPressure < ApplicationRecord
    belongs_to :blood_pressure_condition, foreign_key: "blood_pressure_condition_id"

    validates :user_id, presence: true, numericality: true
    validates :blood_pressure_condition_id, presence: true, numericality: true
    validates :sistole, presence: true
    validates :diastole, presence: true
    validates :pulse, presence: true
    validates :date_time, presence: true

    

    
    
end
