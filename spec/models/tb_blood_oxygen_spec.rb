require 'rails_helper'

RSpec.describe TbBloodOxygen, type: :model do
  describe 'INSERT data blood oxygen' do
    it 'is invalid insert without a nil data' do
			bloodOxygen = TbBloodOxygen.create(
        blood_oxygen: nil,
        date_time: nil,
        user_id: nil,
        blood_oxygen_condition_id: nil
			)
			bloodOxygen.valid?
			expect(bloodOxygen.errors[:blood_oxygen]).to include("can't be blank")
      expect(bloodOxygen.errors[:date_time]).to include("can't be blank")
      expect(bloodOxygen.errors[:user_id]).to include("can't be blank")
      expect(bloodOxygen.errors[:blood_oxygen_condition_id]).to include("can't be blank")
		end

    it 'is invalid insert with invalid id oxygen blood condition' do
      bloodOxygenConditon = TbBloodOxygenCondition.create(
				name: 'low'
			)

      bloodOxygen = TbBloodOxygen.create(
        blood_oxygen: 98,
        date_time: Time.now,
        user_id: 1,
        blood_oxygen_condition_id: 2
			)
      bloodOxygen.valid?
			expect(bloodOxygen.errors[:tb_blood_oxygen_condition]).to include("must exist")
		end

    it 'is valid insert data blood oxygen' do
      bloodOxygenConditon = TbBloodOxygenCondition.create(
				name: 'normal'
			)

      bloodOxygen = TbBloodOxygen.create(
        blood_oxygen: 98,
        date_time: Time.now,
        user_id: 1,
        blood_oxygen_condition_id: bloodOxygenConditon.id
			)
      expect(bloodOxygenConditon).to be_valid
			expect(bloodOxygen).to be_valid
		end
  end
end
