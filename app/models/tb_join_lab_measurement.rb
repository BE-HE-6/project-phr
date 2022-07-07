class TbJoinLabMeasurement < ApplicationRecord
    belongs_to :tb_lab_result, foreign_key: :result_id
    belongs_to :tb_lab_measurements, foreign_key: :measurement_id

    validates :value, presence: true
end
