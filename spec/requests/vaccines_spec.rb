require 'rails_helper'

RSpec.describe "Vaccines", type: :request do
	let!(:vaccine_categories) { create_list(:TbVaccineCategory, 5) }
    let!(:vaccines) { create_list(:TbVaccine, 5) }
    let(:vaccine_id) { vaccines.first.id }

    describe "GET /api/vaccines" do
        before { get '/api/vaccines' }
        it 'return vaccines' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body).size).to eq(5)
        end
        
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end
end
