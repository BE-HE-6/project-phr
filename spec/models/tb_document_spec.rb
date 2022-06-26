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
                doc_upload: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                user_id: 1,
                document_category_id: documentCategory.id
			)
			expect(documentCategory).to be_valid
			expect(document).to be_valid
		end
	end

    describe '-- UPDATE Document' do
        it 'is invalid update without valid id' do
            expect { 
                document = TbDocument.find(1)
                document.update(
                    doc_name: 'Diagnosa Penyakit COVID-19'
                ) 
            }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it 'is invalid update without a name' do
			documentCategory = TbDocumentCategory.create(
				name: 'Diagnose'
			)
			document = TbDocument.create(
				doc_name: 'Diagnosa Penyakit COVID-19',
                doc_upload: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                user_id: 1,
                document_category_id: documentCategory.id
			)
            document.update(
                doc_name: nil
            )
            document.valid?
            expect(document.errors[:doc_name]).to include("can't be blank")
        end
        
        it 'is valid update document' do
			documentCategory = TbDocumentCategory.create(
				name: 'Diagnose'
			)
			document = TbDocument.create(
				doc_name: 'Diagnosa Penyakit COVID-19',
                doc_upload: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                user_id: 1,
                document_category_id: documentCategory.id
			)
            document.update(
                doc_name: 'Sertifikat Vaksin COVID-19',
            )
            expect(document).to be_valid
        end
    end

    describe '-- DELETE Document' do
        it 'is invalid delete without valid id' do
            expect { TbDocument.destroy(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        # it 'is valid delete document' do
		# 	documentCategory = TbDocumentCategory.create(
		# 		name: 'Diagnose'
		# 	)
		# 	document = TbDocument.create(
		# 		doc_name: 'Diagnosa Penyakit COVID-19',
        #         doc_upload: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
        #         user_id: 1,
        #         document_category_id: documentCategory.id
		# 	)
        #     # puts document.id
        #     # documentDeleted = TbDocument.destroy(document.id)
        #     # puts documentDeleted.inspect
        #     # puts TbDocument.all.inspect
        #     # puts TbDocument.find(document.id).inspect
        #     # expect(TbDocument.destroy(document.id)).to be_valid
        # end
    end

    describe '-- GET Document' do
        it 'is invalid get without valid id' do
            expect { TbDocument.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it 'is valid get document with valid id' do
			documentCategory = TbDocumentCategory.create(
				name: 'Diagnose'
			)
			TbDocument.create(
				doc_name: 'Diagnosa Penyakit COVID-19',
                doc_upload: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                user_id: 1,
                document_category_id: documentCategory.id
			)
            document = TbDocument.find(1)
            expect(document).to be_valid
        end
    end
end
