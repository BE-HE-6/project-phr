require 'rails_helper'

RSpec.describe TbBloodOxygenCondition, type: :model do
  describe 'INSERT data blood oxygen condition' do
    it 'is invalid insert without a name' do
			bloodOxygenConditon = TbBloodOxygenCondition.create(
				name: nil
			)
			bloodOxygenConditon.valid?
			expect(bloodOxygenConditon.errors[:name]).to include("can't be blank")
		end

    it "is invalid insert with a duplicate name" do
			bloodOxygenConditon1 = TbBloodOxygenCondition.create(
				name: 'high'
			)
			bloodOxygenConditon2 = TbBloodOxygenCondition.create(
				name: 'high'
			)
		
			bloodOxygenConditon2.valid?
			expect(bloodOxygenConditon2.errors[:name]).to include("has already been taken")
		end

    it 'is valid create new data blood condition' do
			bloodOxygenConditon = TbBloodOxygenCondition.create(
				name: 'low'
			)
			expect(bloodOxygenConditon).to be_valid
		end
  end
end
