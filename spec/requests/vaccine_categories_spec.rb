require 'rails_helper'

RSpec.describe "VaccineCategories", type: :request do
	let!(:vaccine_categories) { create_list(:TbVaccineCategory, 5) }
    let(:vaccine_category_id) { vaccine_categories.first.id }

    describe 'GET /api/vaccine_categories' do
        before { get '/api/vaccine_categories' }
        it 'return vaccine categories' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body).size).to eq(5)
        end
        
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end
end
