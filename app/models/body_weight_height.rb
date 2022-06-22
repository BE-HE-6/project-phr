class BodyWeightHeight < ApplicationRecord
  validates :user_id, presence: true, numericality: true
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 1}
  validates :height, presence: true, numericality: { greater_than_or_equal_to: 1}
  validates :date_time, presence: true
  before_save :get_bmi
end
