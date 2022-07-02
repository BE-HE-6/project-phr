class TbLabMeasurement < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
