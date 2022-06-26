require 'rails_helper'

RSpec.describe TbBloodGlucoseCondition, type: :model do
  describe 'INSERT data blood glucose condition' do
    it 'is invalid insert without a name' do
			bloodGlucoseCondition = TbBloodGlucoseCondition.create(
				name: nil
			)
			bloodGlucoseCondition.valid?
			expect(bloodGlucoseCondition.errors[:name]).to include("can't be blank")
		end

    it "is invalid insert with a duplicate name" do
			bloodGlucoseCondition1 = TbBloodGlucoseCondition.create(
				name: 'high'
			)
			bloodGlucoseCondition2 = TbBloodGlucoseCondition.create(
				name: 'high'
			)
		
			bloodGlucoseCondition2.valid?
			expect(bloodGlucoseCondition2.errors[:name]).to include("has already been taken")
		end

    it 'is valid create new data blood condition' do
			bloodGlucoseCondition = TbBloodGlucoseCondition.create(
				name: 'low'
			)
			expect(bloodGlucoseCondition).to be_valid
		end
  end

  describe 'UPDATE data blood glucose condition' do
	it 'is invalid update without valid id' do
		expect { 
			bloodGlucoseCondition = TbBloodGlucoseCondition.find(1)
			bloodGlucoseCondition.update(
				name: 'normal'
			) 
		}.to raise_error(ActiveRecord::RecordNotFound)
	end

	it 'is invalid update without a name' do
		bloodGlucoseCondition = TbBloodGlucoseCondition.create(
			name: "normal"
		)
		bloodGlucoseCondition.update(
			name: nil
		)
		bloodGlucoseCondition.valid?
		expect(bloodGlucoseCondition.errors[:name]).to include("can't be blank")
	end
	
	it "is invalid update with a duplicate name" do
		bloodGlucoseCondition1 = TbBloodGlucoseCondition.create(
			name: 'high'
		)
		bloodGlucoseCondition2 = TbBloodGlucoseCondition.create(
			name: 'low'
		)
		bloodGlucoseCondition2.update(
			name: 'high'
		)
	
		bloodGlucoseCondition2.valid?
		expect(bloodGlucoseCondition2.errors[:name]).to include("has already been taken")
	end
	
	it 'is valid update data blood glucose condition' do
		bloodGlucoseCondition = TbBloodGlucoseCondition.create(
			name: 'low'
		)
		bloodGlucoseCondition.update(
			name: 'high'
		)
		expect(bloodGlucoseCondition).to be_valid
	end
  end

  describe 'DELETE data blood glucose condition' do
	it 'is invalid delete without valid id' do
		expect { TbBloodGlucoseCondition.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
	end
	
	it 'is valid delete blood glucose condition' do
		bloodGlucoseCondition = TbBloodGlucoseCondition.create(
			name: 'low'
		)
		bloodGlucoseCondition.destroy
		expect(bloodGlucoseCondition).to be_valid
	end
  end
end
