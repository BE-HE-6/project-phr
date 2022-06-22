require 'rails_helper'

RSpec.describe "DocumentCategories", type: :request do
	let!(:document_categories) { create_list(:TbDocumentCategory, 5) }
    let(:document_category_id) { document_categories.first.id }

    describe 'GET /api/document_categories' do
        before { get '/api/document_categories' }
        it 'return document categories' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body).size).to eq(5)
        end
        
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end
end
