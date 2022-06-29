require 'rails_helper'

RSpec.describe BloodPressureCondition, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
    it "is valid with a name" do
      FactoryBot.create(:blood_pressure_condition)
    end

    it "is invalid without a name" do
      bpc = BloodPressureCondition.create(name: nil)
      bpc.valid?
      expect(bpc.errors[:name]).to include("can't be blank") 
    end

    it "is invalid with a duplicate name" do
      bpc1 = FactoryBot.create(:blood_pressure_condition)
      bpc2 = FactoryBot.build(:blood_pressure_condition)
      bpc2.valid?
      expect(bpc2.errors[:name]).to include("has already been taken")
    end
  
end
