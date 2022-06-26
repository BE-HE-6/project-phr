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

  describe 'UPDATE data blood oxygen' do
    it 'is invalid update without valid id' do
      expect { 
        bloodOxygen = TbBloodOxygen.find(1)
        bloodOxygen.update(
            blood_oxygen: 96
        ) 
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'is invalid update with null oxygen_blood' do
      bloodOxygenConditon = TbBloodOxygenCondition.create(
				name: 'normal'
			)

      bloodOxygen = TbBloodOxygen.create(
        blood_oxygen: 98,
        date_time: Time.now,
        user_id: 1,
        blood_oxygen_condition_id: bloodOxygenConditon.id
			)

      bloodOxygen.update(
        blood_oxygen: nil
      )

      bloodOxygen.valid?
      expect(bloodOxygen.errors[:blood_oxygen]).to include("can't be blank")
    end

    it 'is valid update blood_oxygen' do
      bloodOxygenConditon = TbBloodOxygenCondition.create(
				name: 'normal'
			)

      bloodOxygen = TbBloodOxygen.create(
        blood_oxygen: 98,
        date_time: Time.now,
        user_id: 1,
        blood_oxygen_condition_id: bloodOxygenConditon.id
			)

      bloodOxygen.update(
        blood_oxygen: 96
      )

      expect(bloodOxygen).to be_valid
    end
  end

  describe 'DELETE data blood oxygen' do
    it 'is invalid delete without valid id' do
      expect { TbBloodOxygen.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    
    it 'is valid delete blood oxygen' do
      bloodOxygenConditon = TbBloodOxygenCondition.create(
				name: 'normal'
			)

      bloodOxygen = TbBloodOxygen.create(
        blood_oxygen: 98,
        date_time: Time.now,
        user_id: 1,
        blood_oxygen_condition_id: bloodOxygenConditon.id
			)
      bloodOxygen.destroy
      expect(bloodOxygen).to be_valid
    end
  end

  describe 'GET data blood oxygen' do
    it 'is invalid get without valid id' do
      expect { TbBloodOxygen.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    
    it 'is valid get blood oxygen' do
      bloodOxygenConditon = TbBloodOxygenCondition.create(
				name: 'normal'
			)

      TbBloodOxygen.create(
        blood_oxygen: 98,
        date_time: Time.now,
        user_id: 1,
        blood_oxygen_condition_id: bloodOxygenConditon.id
			)
      bloodOxygen = TbBloodOxygen.find(1)
      expect(bloodOxygen).to be_valid
    end
  end
end
