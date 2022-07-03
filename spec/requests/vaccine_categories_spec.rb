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

    describe 'GET /api/vaccine_categories/:id' do
        before { get "/api/vaccine_categories/#{vaccine_category_id}" }
    
        context 'when the record does not exist' do
            let(:vaccine_category_id) { 10 }
            it 'return status code 404' do
                expect(response).to have_http_status(404)
            end
            it 'return message not found' do
                expect(JSON.parse(response.body)['message']).to match("Couldn't find TbVaccineCategory with 'id'=10")
            end
        end
    
        context 'when the record exists' do
            it 'return the category' do
                expect(JSON.parse(response.body)).not_to be_empty
                expect(JSON.parse(response.body)['id']).to eq(vaccine_category_id)
            end
        
            it 'return status code 200' do
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'POST /api/vaccine_categories' do
        context 'the request is invalid' do
            before { post '/api/vaccine_categories', params: { name: nil } }
            it 'return status code 422' do
                expect(response).to have_http_status(422)
            end
            it 'return a validation failure message' do
                expect(JSON.parse(response.body)['message']).to match("Validation failed: Name can't be blank")
            end
        end

        context 'the request is valid' do
            before { post '/api/vaccine_categories', params: { name: 'Inactivated vaccines' } }
            it 'created a vaccine category' do
                expect(JSON.parse(response.body)['name']).to eq('Inactivated vaccines')
            end
            it 'return status code 201' do
                expect(response).to have_http_status(201)
            end
        end
    end
    
	describe 'PUT /api/vaccine_categories/:id' do
        context 'when the record exists' do
            before { put "/api/vaccine_categories/#{vaccine_category_id}", params: { name: 'Toxoid vaccines' } }
            it 'updated the record' do
                expect(response.body).to be_empty
            end
            it 'return status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    describe 'DELETE /api/vaccine_categories/:id' do
        context 'when the record does not exist' do
            before { delete "/api/vaccine_categories/1000" }
            it 'return status code ' do
                expect(response).to have_http_status(404)
                expect(JSON.parse(response.body)['message']).to match("Couldn't find TbVaccineCategory with 'id'=1000")
            end
        end
        context 'when the record exists' do
            before { delete "/api/vaccine_categories/#{vaccine_category_id}" }
            it 'return status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end
end
