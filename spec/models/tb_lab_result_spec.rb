require 'rails_helper'

RSpec.describe TbLabResult, type: :model do
	let!(:users) {create_list(:user, 5)}
	describe '-- CREATE Lab Result' do
		it 'is invalid create with nil data' do
			labResult = TbLabResult.create(
				name: nil,
                doc: nil,
                date_time: nil,
                user_id: nil,
                result_category_id: nil
			)
			labResult.valid?
			expect(labResult.errors[:name]).to include("can't be blank")
			expect(labResult.errors[:date_time]).to include("can't be blank")
			expect(labResult.errors[:doc]).to include("can't be blank")
		end
		
		it "is invalid create without a valid Lab Result category id" do
			labResultCategory = TbLabResultCategory.create(
				name: 'Diagnose'
			) # this id is 1
			labResult = TbLabResult.create(
				name: 'Diagnosa Penyakit COVID-19',
                doc: 'file.jpg',
                user_id: users.first.id,
                date_time: "2022-06-22 13:50:19",
                result_category_id: 2
			)
			expect(labResult.errors[:tb_lab_result_category]).to include("must exist")
		end
		
		it 'is valid create new Lab Result data' do
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
			expect(labResultCategory).to be_valid
			expect(labResult).to be_valid
		end
	end
    
    describe '-- DELETE Lab Result' do
        it 'is invalid delete without valid id' do
            expect { TbLabResult.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
    end

    describe '-- GET Lab Result' do
        it 'is invalid get without valid id' do
            expect { TbLabResult.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it 'is valid get Lab Result with valid id' do
			labResultCategory = TbLabResultCategory.create(
				name: 'Diagnose'
			)
			TbLabResult.create(
				name: 'Diagnosa Penyakit COVID-19',
                doc: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                user_id: users.first.id,
                date_time: "2022-06-22 13:50:19",
                result_category_id: labResultCategory.id
			)
            labResult = TbLabResult.find(1)
            expect(labResult).to be_valid
        end
    end
end
