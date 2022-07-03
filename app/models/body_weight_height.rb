class BodyWeightHeight < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true, numericality: true
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 1}
  validates :height, presence: true, numericality: { greater_than_or_equal_to: 1}
  validates :date_time, presence: true
  
  attr_accessor :bmi_calculation
  before_save :bmi_calculation

  def bmi_calculation
    self.weight/((self.height/100)*(self.height/100))
  end
end
