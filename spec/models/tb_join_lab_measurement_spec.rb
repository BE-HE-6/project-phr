require 'rails_helper'

RSpec.describe TbJoinLabMeasurement, type: :model do
	let!(:users) {create_list(:user, 5)}
	describe '-- CREATE Lab Result' do
		it 'is invalid create with nil data' do
			joinLabMeasurement = TbJoinLabMeasurement.create(
				value: nil,
                result_id: nil,
                measurement_id: nil,
			)
			joinLabMeasurement.valid?
			expect(joinLabMeasurement.errors[:value]).to include("can't be blank")
			expect(joinLabMeasurement.errors[:result_id]).to include("can't be blank")
			expect(joinLabMeasurement.errors[:measurement_id]).to include("can't be blank")
		end
		
		it "is invalid create without a valid Lab Result id" do
			labResultCategory = TbLabResultCategory.create(
				name: 'Diagnose'
			)
			
			labMeasurement = TbLabMeasurement.create(
				name: 'Inactivated vaccines'
			)

			joinLabMeasurement = TbJoinLabMeasurement.create(
				value: 'Test',
                result_id: nil,
                measurement_id: labMeasurement.id,
			)
			expect(joinLabMeasurement.errors[:tb_lab_result]).to include("must exist")
		end

		it "is invalid create without a valid Lab Measurement id" do
			labResultCategory = TbLabResultCategory.create(
				name: 'Diagnose'
			)
			labResult = TbLabResult.create(
				name: 'Diagnosa Penyakit COVID-19',
                doc: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                user_id: users.first.id,
                date_time: "2022-06-22 13:50:19",
                result_category_id: labResultCategory.id
			)

			joinLabMeasurement = TbJoinLabMeasurement.create(
				value: 'Test',
                result_id: labResult.id,
                measurement_id: nil,
			)
			expect(joinLabMeasurement.errors[:tb_lab_measurement]).to include("must exist")
		end
		
		it 'is valid create new Join Lab Measurement data' do
			labResultCategory = TbLabResultCategory.create(
				name: 'Diagnose'
			)
			labResult = TbLabResult.create(
				name: 'Diagnosa Penyakit COVID-19',
                doc: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                user_id: users.first.id,
                date_time: "2022-06-22 13:50:19",
                result_category_id: labResultCategory.id
			)
			labMeasurement = TbLabMeasurement.create(
				name: 'Inactivated vaccines'
			)

			joinLabMeasurement = TbJoinLabMeasurement.create(
				value: 'Test',
                result_id: labResult.id,
                measurement_id: labMeasurement.id,
			)
			expect(labResultCategory).to be_valid
			expect(labResult).to be_valid
			expect(labMeasurement).to be_valid
			expect(joinLabMeasurement).to be_valid
		end
	end
    
    describe '-- DELETE Lab Result' do
        it 'is invalid delete without valid id' do
            expect { TbJoinLabMeasurement.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
    end

    describe '-- GET Lab Result' do
        it 'is invalid get without valid id' do
            expect { TbJoinLabMeasurement.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it 'is valid get Lab Result with valid id' do
			labResultCategory = TbLabResultCategory.create(
				name: 'Diagnose'
			)
			labResult = TbLabResult.create(
				name: 'Diagnosa Penyakit COVID-19',
                doc: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                user_id: users.first.id,
                date_time: "2022-06-22 13:50:19",
                result_category_id: labResultCategory.id
			)
			labMeasurement = TbLabMeasurement.create(
				name: 'Inactivated vaccines'
			)

			TbJoinLabMeasurement.create(
				value: 'Test',
                result_id: labResult.id,
                measurement_id: labMeasurement.id,
			)
            joinLabMeasurement = TbJoinLabMeasurement.find(1)
            expect(joinLabMeasurement).to be_valid
        end
    end
end
