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

    describe '-- UPDATE Document Category' do
        it 'is invalid update without valid id' do
            expect { 
                documentCategory = TbDocumentCategory.find(1)
                documentCategory.update(
                    name: 'Diagnose'
                ) 
            }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it 'is invalid update without a name' do
            documentCategory = TbDocumentCategory.create(
                name: "Diagnose"
            )
            documentCategory.update(
                name: nil
            )
            documentCategory.valid?
            expect(documentCategory.errors[:name]).to include("can't be blank")
        end
        
        it "is invalid update with a duplicate name" do
            documentCategory1 = TbDocumentCategory.create(
                name: 'Diagnose'
            )
            documentCategory2 = TbDocumentCategory.create(
                name: 'Medical Billing'
            )
            documentCategory2.update(
                name: 'Diagnose'
            )
        
            documentCategory2.valid?
            expect(documentCategory2.errors[:name]).to include("has already been taken")
        end
        
        it 'is valid update category' do
            documentCategory = TbDocumentCategory.create(
                name: 'Diagnose'
            )
            documentCategory.update(
                name: 'Medical Billing'
            )
            expect(documentCategory).to be_valid
        end
    end

    describe '-- DELETE Document Category' do
        it 'is invalid delete without valid id' do
            expect { TbDocumentCategory.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it 'is valid delete category' do
            documentCategory = TbDocumentCategory.create(
                name: 'Diagnose'
            )
            documentCategory.destroy
            expect(documentCategory).to be_valid
        end
    end
end
