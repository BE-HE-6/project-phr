require 'rails_helper'

RSpec.describe TbDocument, type: :model do
	describe '-- CREATE Document' do
		it 'is invalid create with nil data' do
			document = TbDocument.create(
				doc_name: nil,
                doc_upload: nil,
                user_id: nil,
                document_category_id: nil
			)
			document.valid?
			expect(document.errors[:doc_name]).to include("can't be blank")
			expect(document.errors[:doc_upload]).to include("can't be blank")
			expect(document.errors[:user_id]).to include("can't be blank")
			expect(document.errors[:user_id]).to include("is not a number")
			expect(document.errors[:tb_document_category]).to include("must exist")
			expect(document.errors[:document_category_id]).to include("can't be blank")
			expect(document.errors[:document_category_id]).to include("is not a number")
		end
		
		it "is invalid create without a valid document category id" do
			documentCategory = TbDocumentCategory.create(
				name: 'Diagnose'
			) # this id is 1
			document = TbDocument.create(
				doc_name: 'Diagnosa Penyakit COVID-19',
                doc_upload: 'file.jpg',
                user_id: 1,
                document_category_id: 2
			)
			expect(document.errors[:tb_document_category]).to include("must exist")
		end
		
		it 'is valid create new document data' do
			documentCategory = TbDocumentCategory.create(
				name: 'Diagnose'
			)
			document = TbDocument.create(
				doc_name: 'Diagnosa Penyakit COVID-19',
                doc_upload: 'file.jpg',
                user_id: 1,
                document_category_id: documentCategory.id
			)
			expect(documentCategory).to be_valid
			expect(document).to be_valid
		end
	end
end
