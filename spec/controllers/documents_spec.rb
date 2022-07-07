require 'rails_helper'

RSpec.describe "DocumentsController", type: :request do
    let!(:users) {create_list(:user, 5)}
    let!(:authorize) {authorizeUser(users.first.email, 'Examples20#')}

	let!(:document_categories) { create_list(:TbDocumentCategory, 5) }
    let!(:documents) { create_list(:TbDocument, 5) }
    let(:document_id) { documents.first.id }

    describe "GET /api/documents" do
        before { 
            get "/api/documents", 
            headers: {
                Authorization: "Bearer #{authorize}"
            } 
        }
        it 'return documents' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body).size).to eq(5)
        end
        
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'GET /api/documents/:id' do
        before { 
            get "/api/documents/#{document_id}", 
            headers: {
                Authorization: "Bearer #{authorize}"
            }
        }
        context 'when the record does not exist' do
            let(:document_id) { 100 }
        
            it 'return status code 404' do
                expect(response).to have_http_status(404)
                expect(JSON.parse(response.body)['message']).to match("Couldn't find TbDocument with 'id'=100")
            end
        end

        context 'when the record exists' do
            it 'return the item' do
                expect(JSON.parse(response.body)).not_to be_empty
                expect(JSON.parse(response.body)['id']).to eq(document_id)
            end
        
            it 'return status code 200' do
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'POST /api/documents' do
        context 'the request is invalid' do
            it "name can't be blank" do
                post "/api/documents/", params: { 
                    doc_name: "",
                    doc_upload: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                    document_category_id: Faker::Number.between(from: 1, to: 5)
                }, headers: {
                    Authorization: "Bearer #{authorize}"
                }
                expect(response).to have_http_status(422)
                expect(JSON.parse(response.body)['message']).to match("Validation failed: Doc name can't be blank")
            end
            it "Document Upload can't be blank" do
                post "/api/documents/", params: { 
                    doc_name: 'Diagnosa Penyakit COVID-19',
                    doc_upload: "",
                    document_category_id: Faker::Number.between(from: 1, to: 5)
                },
                headers: {
                    Authorization: "Bearer #{authorize}"
                }
                expect(response).to have_http_status(422)
                expect(JSON.parse(response.body)['message']).to match("Validation failed: Doc upload can't be blank")
            end
            it "document category id can't be blank" do
                post "/api/documents/", params: { 
                    doc_name: 'Diagnosa Penyakit COVID-19',
                    doc_upload: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                    document_category_id: nil
                },
                headers: {
                    Authorization: "Bearer #{authorize}"
                }
                expect(response).to have_http_status(422)
                expect(JSON.parse(response.body)['message']).to match("Validation failed: Tb document category must exist, Document category can't be blank, Document category is not a number")
            end
            it "document category must exist" do
                post "/api/documents/", params: { 
                    doc_name: 'Diagnosa Penyakit COVID-19',
                    doc_upload: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                    document_category_id: 1000
                },
                headers: {
                    Authorization: "Bearer #{authorize}"
                }
                expect(response).to have_http_status(422)
                expect(JSON.parse(response.body)['message']).to match("Validation failed: Tb document category must exist")
            end
        end

        context 'the request is valid' do
            it 'created a document' do
                post "/api/documents/", params: {  
                    doc_name: 'Sertifikat Vaksin COVID-19',
                    doc_upload: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
                    document_category_id: Faker::Number.between(from: 1, to: 5)
                } ,
                headers: {
                    Authorization: "Bearer #{authorize}"
                }
                expect(response).to have_http_status(201)
            end
        end
    end

    describe 'DELETE /api/documents/:id' do
        context 'when the record does not exist' do
            before { 
                delete "/api/documents/1000", 
                headers: {
                    Authorization: "Bearer #{authorize}"
                }
            }
            it 'return status code ' do
                expect(response).to have_http_status(404)
                expect(JSON.parse(response.body)['message']).to match("Couldn't find TbDocument with 'id'=1000")
            end
        end
        context 'when the record exists' do
            before { 
                delete "/api/documents/#{document_id}", 
                headers: {
                    Authorization: "Bearer #{authorize}"
                }
            }
            it 'return status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end
end
