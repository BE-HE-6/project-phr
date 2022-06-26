require 'rails_helper'

RSpec.describe TbBloodGlucose, type: :model do
  describe 'INSERT data blood glucose' do
    it 'is invalid insert without a nil data' do
			bloodGlucose = TbBloodGlucose.create(
        blood_glucose: nil,
        date_time: nil,
        user_id: nil,
        blood_glucose_condition_id: nil
			)
			bloodGlucose.valid?
			expect(bloodGlucose.errors[:blood_glucose]).to include("can't be blank")
      expect(bloodGlucose.errors[:date_time]).to include("can't be blank")
      expect(bloodGlucose.errors[:user_id]).to include("can't be blank")
      expect(bloodGlucose.errors[:blood_glucose_condition_id]).to include("can't be blank")
		end

    it 'is invalid insert with invalid id oxygen blood condition' do
      bloodGlucoseCondition = TbBloodGlucoseCondition.create(
				name: 'high'
			)

      bloodGlucose = TbBloodGlucose.create(
        blood_glucose: 98,
        date_time: Time.now,
        user_id: 1,
        blood_glucose_condition_id: 2
			)
      bloodGlucose.valid?
			expect(bloodGlucose.errors[:tb_blood_glucose_condition]).to include("must exist")
		end

    it 'is valid insert data blood oxygen' do
      bloodGlucoseCondition = TbBloodGlucoseCondition.create(
				name: 'normal'
			)

      bloodGlucose = TbBloodGlucose.create(
        blood_glucose: 98,
        date_time: Time.now,
        user_id: 1,
        blood_glucose_condition_id: bloodGlucoseCondition.id
			)
      expect(bloodGlucoseCondition).to be_valid
			expect(bloodGlucose).to be_valid
		end
  end

  describe 'UPDATE data blood oxygen' do
    it 'is invalid update without valid id' do
      expect { 
        bloodGlucose = TbBloodGlucose.find(1)
        bloodGlucose.update(
            blood_glucose: 96
        ) 
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'is invalid update with null oxygen_blood' do
      bloodGlucoseCondition = TbBloodGlucoseCondition.create(
				name: 'normal'
			)

      bloodGlucose = TbBloodGlucose.create(
        blood_glucose: 98,
        date_time: Time.now,
        user_id: 1,
        blood_glucose_condition_id: bloodGlucoseCondition.id
			)

      bloodGlucose.update(
        blood_glucose: nil
      )

      bloodGlucose.valid?
      expect(bloodGlucose.errors[:blood_glucose]).to include("can't be blank")
    end

    it 'is valid update blood_oxygen' do
      bloodGlucoseCondition = TbBloodGlucoseCondition.create(
				name: 'normal'
			)

      bloodGlucose = TbBloodGlucose.create(
        blood_glucose: 98,
        date_time: Time.now,
        user_id: 1,
        blood_glucose_condition_id: bloodGlucoseCondition.id
			)

      bloodGlucose.update(
        blood_glucose: 96
      )

      expect(bloodGlucose).to be_valid
    end
  end

  describe 'DELETE data blood oxygen' do
    it 'is invalid delete without valid id' do
      expect { TbBloodGlucose.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    
    it 'is valid delete blood oxygen' do
      bloodGlucoseCondition = TbBloodGlucoseCondition.create(
				name: 'normal'
			)

      bloodGlucose = TbBloodGlucose.create(
        blood_glucose: 98,
        date_time: Time.now,
        user_id: 1,
        blood_glucose_condition_id: bloodGlucoseCondition.id
			)
      bloodGlucose.destroy
      expect(bloodGlucose).to be_valid
    end
  end

  describe 'GET data blood oxygen' do
    it 'is invalid get without valid id' do
      expect { TbBloodGlucose.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    
    it 'is valid get blood oxygen' do
      bloodGlucoseCondition = TbBloodGlucoseCondition.create(
				name: 'normal'
			)

      TbBloodGlucose.create(
        blood_glucose: 98,
        date_time: Time.now,
        user_id: 1,
        blood_glucose_condition_id: bloodGlucoseCondition.id
			)
      bloodGlucose = TbBloodGlucose.find(1)
      expect(bloodGlucose).to be_valid
    end
  end
end
