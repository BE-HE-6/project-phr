class TbBloodGlucose < ApplicationRecord
    belongs_to :tb_blood_glucose_condition, foreign_key: :blood_glucose_condition_id
    belongs_to :user

    validates :blood_glucose, presence: true
    validates :date_time, presence: true
    validates :user_id, presence: true, numericality: true
    validates :blood_glucose_condition_id, presence: true, numericality: true
end
