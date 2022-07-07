class TbJoinLabMeasurement < ApplicationRecord
    belongs_to :tb_lab_result, foreign_key: :result_id
    belongs_to :tb_lab_measurement, foreign_key: :measurement_id

    validates :measurement_id, presence: true, numericality: true
    validates :result_id, presence: true, numericality: true
    validates :value, presence: true
end
