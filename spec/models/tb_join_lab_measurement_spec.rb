require 'rails_helper'

RSpec.describe TbJoinLabMeasurement, type: :model do
	describe '-- CREATE Join Lab Measurement' do
		it 'is invalid create with nil data' do
			labmeasurement = TbJoinLabMeasurement.create(
				value: nil,
        lab_measurement_id: nil,
        lab_result_id: nil,
        lab_result_tb_user_id: nil,
        lab_result_tb_lab_result_category_id: nil
			)
			labmeasurement.valid?
			expect(labmeasurement.errors[:value]).to include("can't be blank")
      expect(labmeasurement.errors[:tb_lab_measurement]).to include("must exist")
			expect(labmeasurement.errors[:lab_measurement_id]).to include("is not a number")
      # expect(labmeasurement.errors[:tb_lab_result]).to include("must exist")
			expect(labmeasurement.errors[:lab_result_id]).to include("can't be blank")
			expect(labmeasurement.errors[:lab_result_tb_user_id]).to include("is not a number")
			expect(labmeasurement.errors[:lab_result_tb_lab_result_category_id]).to include("is not a number")
		end
		
		it "is invalid create without a valid lab measurement id" do
			labMeasurement = TbLabMeasurement.create(
				name: 'Inactivated lab measurement'
			) 
			labmeasurement = TbJoinLabMeasurement.create(
				value: 100,
        lab_measurement_id: 2,
        lab_result_id: 1,
        lab_result_tb_user_id: 1,
        lab_result_tb_lab_result_category_id: 1
			)
			expect(labmeasurement.errors[:tb_lab_measurement]).to include("must exist")
			# expect(labmeasurement.errors[:tb_lab_result]).to include("must exist")
		end
		
		it 'is valid create new lab measurement data' do
			labMeasurement = TbLabMeasurement.create(
				name: 'Inactivated lab measurement'
			)
			labmeasurement = TbJoinLabMeasurement.create(
				value: 100,
        lab_measurement_id: labMeasurement.id,
        lab_result_id: 1,
        lab_result_tb_user_id: 1,
        lab_result_tb_lab_result_category_id: 1
			)
			expect(labMeasurement).to be_valid
			# expect(labmeasurement).to be_valid
		end
    
	end

    describe '-- GET Lab Measurement' do
        # it 'is invalid get without valid id' do
        #     expect { TbJoinLabMeasurement.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
        # end

        it 'is valid get Lab Measurement with valid id' do
			labMeasurement = TbLabMeasurement.create(
				name: 'Inactivated lab measurement'
			)
			TbJoinLabMeasurement.create(
				value: 100,
        lab_measurement_id: labMeasurement.id,
        lab_result_id: 1,
        lab_result_tb_user_id: 1,
        lab_result_tb_lab_result_category_id: 1
			)
            # labmeasurement = TbJoinLabMeasurement.find(1)
            # expect(labmeasurement).to be_valid
        end
    end
end
