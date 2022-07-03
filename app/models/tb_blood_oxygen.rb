class TbBloodOxygen < ApplicationRecord
    belongs_to :tb_blood_oxygen_condition, foreign_key: :blood_oxygen_condition_id

    validates :blood_oxygen, presence: true
    validates :date_time, presence: true
    validates :user_id, presence: true, numericality: true
    validates :blood_oxygen_condition_id, presence: true, numericality: true
end
