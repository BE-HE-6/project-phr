class TbBloodOxygen < ApplicationRecord

    validates :blood_oxygen, presence: true
    validates :date_time, presence: true
    validates :user_id, presence: true, numericality: true
    validates :blood_oxygen_condition_id, presence: true, numericality: true
end
