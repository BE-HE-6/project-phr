require 'rails_helper'

RSpec.describe TbLabResult, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '-- CREATE Lab Result' do
		it 'is invalid create with nil data' do
			labresult = TbLabResult.create(
				lab_name: nil,
                lab_doc: nil,
                lab_result_note: nil,
                user_id: nil,
                lab_result_category_id: nil
			)
			labresult.valid?
			expect(labresult.errors[:lab_name]).to include("can't be blank")
			expect(labresult.errors[:lab_doc]).to include("can't be blank")
			expect(labresult.errors[:lab_result_note]).to include("can't be blank")
			expect(labresult.errors[:user_id]).to include("is not a number")
            expect(labresult.errors[:lab_result_category_id]).to include("is not a number")
			expect(labresult.errors[:tb_lab_result_category]).to include("must exist")
			expect(labresult.errors[:lab_result_category_id]).to include("can't be blank")
			expect(labresult.errors[:lab_result_category_id]).to include("is not a number")
		end
		
		it "is invalid create without a valid labresult category id" do
			labresultCategory = TbLabResultCategory.create(
				name: 'Inactivated labresult'
			) 
			labresult = TbLabResult.create(
				lab_name: 'RSUD Jakarta',
                lab_doc: 'Upload File',
                lab_result_note: 'Catatan Pasien',
                user_id: 1,
                lab_result_category_id: 2
			)
			expect(labresult.errors[:tb_lab_result_category]).to include("must exist")
		end
		
		it 'is valid create new labresult data' do
			labresultCategory = TbLabResultCategory.create(
				name: 'Inactivated labresult'
			)
			labresult = TbLabResult.create(
				lab_name: 'RSUD Jakarta',
                lab_doc: 'Upload File',
                lab_result_note: 'Catatan Pasien',
                user_id: 1,
                lab_result_category_id: labresultCategory.id
			)
			expect(labresultCategory).to be_valid
			expect(labresult).to be_valid
		end
	end
    describe '-- UPDATE Lab Result' do
        it 'is invalid update without valid id' do
            expect { 
                labresult = TbLabResult.find(1)
                labresult.update(
                    lab_name: 'RSUD Jakarta'
                ) 
            }.to raise_error(ActiveRecord::RecordNotFound)
        end
        it 'is invalid update without a name' do
			labresultCategory = TbLabResultCategory.create(
				name: 'Inactivated labresult'
			)
			labresult = TbLabResult.create(
				lab_name: 'RSUD Jakarta',
                lab_doc: 'Upload File',
                lab_result_note: 'Catatan Pasien',
                user_id: 1,
                lab_result_category_id: labresultCategory.id
			)
            labresult.update(
                lab_name: nil
            )
            labresult.valid?
            expect(labresult.errors[:lab_name]).to include("can't be blank")
        end
        
        it 'is valid update Lab Result' do
			labresultCategory = TbLabResultCategory.create(
				name: 'Inactivated labresult'
			)
			labresult = TbLabResult.create(
				lab_name: 'RSUD Jakarta',
                lab_doc: 'Upload File',
                lab_result_note: 'Catatan Pasien',
                user_id: 1,
                lab_result_category_id: labresultCategory.id
			)
            labresult.update(
                lab_name: 'RSUD Jakarta',
            )
            expect(labresult).to be_valid
        end
    end
    describe '-- DELETE Lab Result' do
        it 'is invalid delete without valid id' do
            expect { TbLabResult.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it 'is valid delete Lab Result' do
			labresultCategory = TbLabResultCategory.create(
				name: 'Inactivated labresult'
			)
			labresult = TbLabResult.create(
				lab_name: 'RSUD Jakarta',
                lab_doc: 'Upload File',
                lab_result_note: 'Catatan Pasien',
                user_id: 1,
                lab_result_category_id: labresultCategory.id
			)
            labresult.destroy
            expect(labresult).to be_valid
        end
    end

    describe '-- GET Lab Result' do
        it 'is invalid get without valid id' do
            expect { TbLabResult.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it 'is valid get Lab Result with valid id' do
			labresultCategory = TbLabResultCategory.create(
				name: 'Inactivated labresult'
			)
			TbLabResult.create(
				lab_name: 'RSUD Jakarta',
                lab_doc: 'Upload File',
                lab_result_note: 'Catatan Pasien',
                user_id: 1,
                lab_result_category_id: labresultCategory.id
			)
            labresult = TbLabResult.find(1)
            expect(labresult).to be_valid
        end
    end
end
