require 'rails_helper'

RSpec.describe BloodPressureCondition, type: :model do
  
    describe "CREATE Blood Pressure Condition" do
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

    describe "GET Blood Pressure Condition" do
      it 'is valid GET with valid ID' do
        BloodPressureCondition.create(
          name: 'Wake Up'
        )
        bpc = BloodPressureCondition.find(1)
        expect(bpc).to be_valid
      end

      it 'is invalid without valid ID' do
        expect {BloodPressureCondition.find(1).to raise_error(ActiveRecord::RecordNotFound)}
      end
    end

    describe "UPDATE Blood Pressure Condition" do
      it 'is valid with valid ID' do
          bpc = BloodPressureCondition.create(
            name: 'Wake Up'
          )

          bpc.update(
            name: 'After Exercise'
          )
          expect(bpc).to be_valid
      end

      it 'is invalid without valid ID' do
        expect{
          bpc = BloodPressureCondition.find(1)
          bpc.update(
            name: 'Disable Condition'
          )
        }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'is invalid with nil data' do
        bpc = FactoryBot.create(:blood_pressure_condition)
        bpc.update(
          name: nil
        )
        bpc.valid?
        expect(bpc.errors[:name]).to include("can't be blank")
      end
    end

    describe "DELETE Blood Pressure Condition" do
      it 'is valid with valid ID' do
        bpc = FactoryBot.create(:blood_pressure_condition)
        bpc.destroy
        expect(bpc).to be_valid
      end

      it 'is invalid without valid ID' do
        expect {
          BloodPressureCondition.find(1).destroy
      }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
    
    
  
end
