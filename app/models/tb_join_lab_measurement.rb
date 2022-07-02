class TbJoinLabMeasurement < ApplicationRecord
    belongs_to :tb_lab_measurement, foreign_key: :lab_measurement_id
    belongs_to :tb_lab_result, foreign_key: :lab_result_id

    validates :value, presence: true, numericality: true
    validates :lab_measurement_id, presence: true, numericality: true
    validates :lab_result_id, presence: true, numericality: true
    validates :lab_result_tb_user_id, presence: true, numericality: true
    validates :lab_result_tb_lab_result_category_id, presence: true, numericality: true
end
