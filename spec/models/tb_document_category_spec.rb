require 'rails_helper'

RSpec.describe TbDocumentCategory, type: :model do
	describe '-- CREATE Document Category' do
		it 'is invalid create without a name' do
			documentCategory = TbDocumentCategory.create(
				name: nil
			)
			documentCategory.valid?
			expect(documentCategory.errors[:name]).to include("can't be blank")
		end
		
		it "is invalid create with a duplicate name" do
			documentCategory1 = TbDocumentCategory.create(
				name: 'Diagnose'
			)
			documentCategory2 = TbDocumentCategory.create(
				name: 'Diagnose'
			)
		
			documentCategory2.valid?
			expect(documentCategory2.errors[:name]).to include("has already been taken")
		end
		
		it 'is valid create new category' do
			documentCategory = TbDocumentCategory.create(
				name: 'Diagnose'
			)
			expect(documentCategory).to be_valid
		end
	end
end
