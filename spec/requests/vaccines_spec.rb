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

    describe 'GET /api/vaccines/:id' do
        before { get "/api/vaccines/#{vaccine_id}" }
        context 'when the record does not exist' do
            let(:vaccine_id) { 100 }
        
            it 'return status code 404' do
                expect(response).to have_http_status(404)
                expect(JSON.parse(response.body)['message']).to match("Couldn't find TbVaccine with 'id'=100")
            end
        end

        context 'when the record exists' do
            it 'return the item category' do
                expect(JSON.parse(response.body)).not_to be_empty
                expect(JSON.parse(response.body)['id']).to eq(vaccine_id)
            end
        
            it 'return status code 200' do
                expect(response).to have_http_status(200)
            end
        end
    end
end
