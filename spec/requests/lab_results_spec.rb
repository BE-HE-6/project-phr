require 'rails_helper'

RSpec.describe "LabResults", type: :request do
  let!(:lab_result_categories) { create_list(:TbLabResultCategory, 5) }
  let!(:labresults) { create_list(:TbLabResult, 5) }
  let(:lab_result_id) { labresults.first.id }

  describe "GET /api/lab_results" do
    before { get '/api/lab_results' }
    it 'return labresults' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body).size).to eq(5)
    end
    
    it 'return status code 200' do
        expect(response).to have_http_status(200)
    end
end
describe 'GET /api/lab_results/:id' do
    before { get "/api/lab_results/#{lab_result_id}" }
    context 'when the record does not exist' do
        let(:lab_result_id) { 100 }
    
        it 'return status code 404' do
            expect(response).to have_http_status(404)
            expect(JSON.parse(response.body)['message']).to match("Couldn't find TbLabResult with 'id'=100")
        end
    end
    context 'when the record exists' do
        it 'return the item category' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body)['id']).to eq(lab_result_id)
        end
    
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end
end
describe 'POST /api/lab_results' do
    context 'the request is invalid' do
        it "lab name can't be blank" do
            post '/api/lab_results', params: { 
              lab_name: nil,
              lab_doc: 'Upload File',
              lab_result_note: 'Catatan Pasien',
              user_id: 1,
              lab_result_category_id: Faker::Number.between(from: 1, to: 5)
            }
            expect(response).to have_http_status(422)
            expect(JSON.parse(response.body)['message']).to match("Validation failed: Lab name can't be blank")
        end
        it "lab document can't be blank" do
            post '/api/lab_results', params: { 
                lab_name: 'Inactivated labresults',
                lab_doc: nil,
                lab_result_note: 'Catatan Pasien',
                user_id: 1,
                lab_result_category_id: Faker::Number.between(from: 1, to: 5)
            }
            expect(response).to have_http_status(422)
            expect(JSON.parse(response.body)['message']).to match("Validation failed: Lab doc can't be blank")
        end
        it "lab note can't be blank" do
          post '/api/lab_results', params: { 
              lab_name: 'Inactivated labresults',
              lab_doc: 'Upload File',
              lab_result_note: nil,
              user_id: 1,
              lab_result_category_id: Faker::Number.between(from: 1, to: 5)
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['message']).to match("Validation failed: Lab result note can't be blank")
      end
        it "user id can't be blank" do
            post '/api/lab_results', params: { 
                lab_name: 'Inactivated labresults',
                lab_doc: 'Upload File',
                lab_result_note: 'Catatan Pasien',
                user_id: nil,
                vaccine_category_id: Faker::Number.between(from: 1, to: 5)
            }
            expect(response).to have_http_status(422)
            expect(JSON.parse(response.body)['message']).to match("Validation failed: Tb lab result category must exist, User can't be blank, User is not a number, Lab result category can't be blank, Lab result category is not a number")
        end
        it "lab result category id can't be blank" do
            post '/api/lab_results', params: { 
              lab_name: 'Inactivated labresults',
              lab_doc: 'Upload File',
              lab_result_note: 'Catatan Pasien',
              user_id: 1,
              vaccine_category_id: nil
            }
            expect(response).to have_http_status(422)
            expect(JSON.parse(response.body)['message']).to match("Validation failed: Tb lab result category must exist, Lab result category can't be blank, Lab result category is not a number")
        end
    end
    context 'the request is valid' do
        it 'created a lab result' do
            post '/api/lab_results', params: {  
              lab_name: 'Inactivated labresults',
              lab_doc: 'Upload File',
              lab_result_note: 'Catatan Pasien',
              user_id: 1,
              lab_result_category_id: Faker::Number.between(from: 1, to: 5)
            } 
            expect(response).to have_http_status(201)
        end
    end
end

describe 'DELETE /api/lab_results/:id' do
    context 'when the record does not exist' do
        before { delete "/api/lab_results/1000" }
        it 'return status code ' do
            expect(response).to have_http_status(404)
            expect(JSON.parse(response.body)['message']).to match("Couldn't find TbLabResult with 'id'=1000")
        end
    end
    context 'when the record exists' do
        before { delete "/api/lab_results/#{lab_result_id}" }
        it 'return status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end
end
