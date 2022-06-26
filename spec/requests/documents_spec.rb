require 'rails_helper'

RSpec.describe "Documents", type: :request do
	let!(:document_categories) { create_list(:TbDocumentCategory, 5) }
    let!(:documents) { create_list(:TbDocument, 5) }
    let(:document_id) { documents.first.id }

    describe "GET /api/documents" do
        before { get '/api/documents' }
        it 'return documents' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body).size).to eq(5)
        end
        
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'GET /api/documents/:id' do
        before { get "/api/documents/#{document_id}" }
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
end
