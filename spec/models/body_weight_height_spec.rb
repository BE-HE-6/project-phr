require 'rails_helper'

RSpec.describe BodyWeightHeight, type: :model do
  describe 'CREATE BodyWeightHeight' do
    it "is valid with user_id, weight, height, note, and bmi_calculation" do
      expect(FactoryBot.build(:body_weight_height)).to be_valid
    end

    it "is invalid with nil data weight, height, bmi_calculation and datetime" do
      bwh = BodyWeightHeight.create(
        user_id: nil,
        weight: nil,
        height: nil,
        bmi_calculation: nil,
        date_time: nil
      )
      bwh.valid?
      expect(bwh.errors[:user_id]).to include("can't be blank")
      expect(bwh.errors[:user_id]).to include("is not a number")
      expect(bwh.errors[:weight]).to include("can't be blank")
      expect(bwh.errors[:height]).to include("can't be blank")
      expect(bwh.errors[:date_time]).to include("can't be blank")
    end

    it "is invalid with weight and height not a number" do
      bwh = FactoryBot.build(
          :body_weight_height,
          weight: "Delapan puluh koma lima",
          height: "Seratus duabelas koma lima"
        )
      bwh.valid?
      expect(bwh.errors[:weight]).to include("is not a number")
      expect(bwh.errors[:height]).to include("is not a number")
    end

    it "is invalid with weight and height lower than 1" do
      bwh = FactoryBot.build(
        :body_weight_height,
        weight: 0.1,
        height: 0.1
      )
      bwh.valid?
      expect(bwh.errors[:weight]).to include("must be greater than or equal to 1")
    end

    it "has valid bmi_calculation" do
      bwh = FactoryBot.build(
        :body_weight_height,
        weight: 85.0,
        height: 175.0
      )
      result = bwh.get_bmi
      expect(result).to eq(27.755102040816325)
    end
  end

  describe 'GET BodyWeightHeight' do
    it "is valid GET BodyWeightHeight with valid ID" do
      # example this id = 1
      FactoryBot.create(:body_weight_height, id: 1)
      bwh = BodyWeightHeight.find(1)
      expect(bwh).to be_valid
    end
  end

  describe 'DELETE BodyWeightHeight' do
    it "is valid DELETE BodyWeightHeight" do
      bwh = FactoryBot.create(:body_weight_height)
      bwh.destroy
      expect(bwh).to be_valid
    end
  end

  describe 'UPDATE BodyWeightHeight' do
    it "is invalid update without valid id" do
      FactoryBot.create(:body_weight_height, id: 1)
      bwh = BodyWeightHeight.find(1)
      expect(bwh).to be_valid
    end
    it "is invalid update with nil data" do
      bwh = FactoryBot.create(:body_weight_height, id: 1)
      bwh.update(
        weight: nil
      )
      bwh.valid?
      expect(bwh.errors[:weight]).to include("can't be blank")
    end
  end
end
