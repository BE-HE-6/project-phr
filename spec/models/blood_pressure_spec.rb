require 'rails_helper'

RSpec.describe BloodPressure, type: :model do

  it { should belong_to(:blood_pressure_condition)}

  describe 'CREATE a Blood Pressure' do
    it 'is valid with a user_id, sistole, diastole, pulse, blood_pressure_condition and datetime' do
      blood_pressure_condition = FactoryBot.create(:blood_pressure_condition)
      blood_pressure = BloodPressure.create(
        user_id: 1,
        blood_pressure_condition_id: blood_pressure_condition.id,
        sistole: 120,
        diastole: 80,
        pulse: 95,
        note: 'Thats a note',
        date_time: '22-10-2022 14:55:13'
      )
      blood_pressure_condition.valid?
      blood_pressure.valid?
      expect(blood_pressure_condition).to be_valid
      expect(blood_pressure).to be_valid
    end

    it 'is invalid with nil data field' do
      bloodPressure = BloodPressure.create(
        user_id: nil,
        blood_pressure_condition_id: nil,
        sistole: nil,
        diastole: nil,
        note: 'Thats a note',
        pulse: nil,
        date_time: nil
      )
      bloodPressure.valid?
      expect(bloodPressure.errors[:user_id]).to include("can't be blank")
      expect(bloodPressure.errors[:user_id]).to include("is not a number")
      expect(bloodPressure.errors[:blood_pressure_condition]).to include("must exist")
      expect(bloodPressure.errors[:blood_pressure_condition_id]).to include("can't be blank")
      expect(bloodPressure.errors[:blood_pressure_condition_id]).to include("is not a number")
      expect(bloodPressure.errors[:sistole]).to include("can't be blank")
      expect(bloodPressure.errors[:diastole]).to include("can't be blank")
      expect(bloodPressure.errors[:pulse]).to include("can't be blank")
      expect(bloodPressure.errors[:date_time]).to include("can't be blank")
    end

    it 'is invalid without a valid blood_pressure_condition id' do
      blood_pressure_condition = FactoryBot.create(:blood_pressure_condition)
      blood_pressure = BloodPressure.create(
        user_id: 1,
        blood_pressure_condition_id: 2,
        sistole: 120,
        diastole: 80,
        pulse: 95,
        note: 'Thats note',
        date_time: '22-10-2022 14:55:13'
      )
      blood_pressure.valid?
      expect(blood_pressure.errors[:blood_pressure_condition]).to include("must exist")
    end

    it 'is invalid with sistole, diastole, and pulse not a number' do
      blood_pressure_condition = FactoryBot.create(:blood_pressure_condition)
      blood_pressure = BloodPressure.create(
        user_id: 1,
        blood_pressure_condition_id: blood_pressure_condition.id,
        note: 'Thats a note',
        sistole: 'Delapan Puluh Lima',
        diastole: 'Seratus dua puluh enam',
        pulse: 'Sembilan puluh dua',
        date_time: '22-10-2022 14:55:13'
      )
      blood_pressure.valid?
      expect(blood_pressure.errors[:sistole]).to include("is not a number")
      expect(blood_pressure.errors[:diastole]).to include("is not a number")
      expect(blood_pressure.errors[:pulse]).to include("is not a number")
    end

  end

  describe "GET Blood Pressure" do  
    it 'is invalid without valid ID' do
      expect { BloodPressure.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "is valid GET blood pressure with valid ID" do
      blood_pressure_condition = FactoryBot.create(:blood_pressure_condition)
      FactoryBot.create(:blood_pressure,
        blood_pressure_condition_id: blood_pressure_condition.id
      )
      blood_pressure = BloodPressure.find(1)
      expect(blood_pressure).to be_valid
    end
  end

  describe "DELETE Blood Pressure" do
    it 'is invalid delete without ID' do
      expect { BloodPressure.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it "is a valid data" do
      blood_pressure_condition = FactoryBot.create(:blood_pressure_condition)
      blood_pressure = FactoryBot.create(:blood_pressure,
        blood_pressure_condition_id: blood_pressure_condition.id
      )
      blood_pressure.destroy
      expect(blood_pressure).to be_valid
    end
  end
  
end
