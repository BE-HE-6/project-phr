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

  describe 'UPDATE data blood oxygen condition' do
	it 'is invalid update without valid id' do
		expect { 
			bloodOxygenConditon = TbBloodOxygenCondition.find(1)
			bloodOxygenConditon.update(
				name: 'Inactivated vaccines'
			) 
		}.to raise_error(ActiveRecord::RecordNotFound)
	end

	it 'is invalid update without a name' do
		bloodOxygenConditon = TbBloodOxygenCondition.create(
			name: "Inactivated vaccines"
		)
		bloodOxygenConditon.update(
			name: nil
		)
		bloodOxygenConditon.valid?
		expect(bloodOxygenConditon.errors[:name]).to include("can't be blank")
	end
	
	it "is invalid update with a duplicate name" do
		bloodOxygenConditon1 = TbBloodOxygenCondition.create(
			name: 'high'
		)
		bloodOxygenConditon2 = TbBloodOxygenCondition.create(
			name: 'low'
		)
		bloodOxygenConditon2.update(
			name: 'high'
		)
	
		bloodOxygenConditon2.valid?
		expect(bloodOxygenConditon2.errors[:name]).to include("has already been taken")
	end
	
	it 'is valid update data blood oxygen condition' do
		bloodOxygenConditon = TbBloodOxygenCondition.create(
			name: 'low'
		)
		bloodOxygenConditon.update(
			name: 'high'
		)
		expect(bloodOxygenConditon).to be_valid
	end
  end

  describe 'DELETE data blood oxygen condition' do
	it 'is invalid delete without valid id' do
		expect { TbBloodOxygenCondition.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
	end
	
	it 'is valid delete category' do
		bloodOxygenConditon = TbBloodOxygenCondition.create(
			name: 'low'
		)
		bloodOxygenConditon.destroy
		expect(bloodOxygenConditon).to be_valid
	end
  end
end
