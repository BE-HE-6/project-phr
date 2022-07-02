require 'rails_helper'

RSpec.describe "LabResultCategories", type: :request do
  let!(:lab_result_categories) { create_list(:TbLabResultCategory, 5) }
  let(:lab_result_category_id) { lab_result_categories.first.id }

  describe 'GET /api/lab_result_categories' do
    before { get '/api/lab_result_categories' }
    it 'return lab result categories' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'return status code 200' do
        expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/lab_result_categories/:id' do
    before { get "/api/lab_result_categories/#{lab_result_category_id}" }

    context 'when the record does not exist' do
        let(:lab_result_category_id) { 10 }
        it 'return status code 404' do
            expect(response).to have_http_status(404)
        end
        it 'return message not found' do
            expect(JSON.parse(response.body)['message']).to match("Couldn't find TbLabResultCategory with 'id'=10")
        end
    end

    context 'when the record exists' do
        it 'return the category' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body)['id']).to eq(lab_result_category_id)
        end
    
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end
end
describe 'POST /api/lab_result_categories' do
    context 'the request is invalid' do
        before { post '/api/lab_result_categories', params: { name: nil } }
        it 'return status code 422' do
            expect(response).to have_http_status(422)
        end
        it 'return a validation failure message' do
            expect(JSON.parse(response.body)['message']).to match("Validation failed: Name can't be blank")
        end
    end
    context 'the request is valid' do
        before { post '/api/lab_result_categories', params: { name: 'Inactivated lab results' } }
        it 'created a lab_result category' do
            expect(JSON.parse(response.body)['name']).to eq('Inactivated lab results')
        end
        it 'return status code 201' do
            expect(response).to have_http_status(201)
        end
    end
end

describe 'PUT /api/lab_result_categories/:id' do
    context 'when the record exists' do
        before { put "/api/lab_result_categories/#{lab_result_category_id}", params: { name: 'Lab RSUD Jakarta' } }
        it 'updated the record' do
            expect(response.body).to be_empty
        end
        it 'return status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end

describe 'DELETE /api/lab_result_categories/:id' do
    context 'when the record does not exist' do
        before { delete "/api/lab_result_categories/1000" }
        it 'return status code ' do
            expect(response).to have_http_status(404)
            expect(JSON.parse(response.body)['message']).to match("Couldn't find TbLabResultCategory with 'id'=1000")
        end
    end
    context 'when the record exists' do
        before { delete "/api/lab_result_categories/#{lab_result_category_id}" }
        it 'return status code 204' do
            expect(response).to have_http_status(204)
        end
    end
  end
end
