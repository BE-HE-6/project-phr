require 'rails_helper'

RSpec.describe 'BloodOxygenConditionsController', type: :request do
  let!(:blood_oxygen_conditions) { create_list(:tb_blood_oxygen_condition, 3) }
  let(:blood_oxygen_condition_id) { blood_oxygen_conditions.first.id }
  let(:blood_oxygen_condition2_name) { blood_oxygen_conditions.second.name }
  
  describe 'GET /api/blood_oxygen_conditions' do
    before { get '/api/blood_oxygen_conditions', headers: {
        Authorization: "Bearer #{authorizeAdmin}"
      } }
    it 'return blood oxygen condition' do
        json_result = JSON.parse(response.body)
        expect(json_result).not_to be_empty
        expect(json_result["data"].size).to eq(3)
    end
    
    it 'return status code 200' do
        expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/blood_oxygen_conditions' do
    context 'the request is invalid' do
        before { 
            post  '/api/blood_oxygen_conditions', 
            params:{
                "blood_oxygen_condition":{
                    "name":""
                }
            },
            headers: {
                Authorization: "Bearer #{authorizeAdmin}"
            }
        }
        it 'return status code 422' do
            expect(response).to have_http_status(422)
        end
        it 'return a validation failure message' do
            expect(JSON.parse(response.body)['message']['name'][0]).to match("can't be blank")
        end
    end

    context 'the request is valid' do
        before { post  '/api/blood_oxygen_conditions', params: {
                "blood_oxygen_condition":{
                    "name":"olahraga"
                }
            },
            headers: {
                Authorization: "Bearer #{authorizeAdmin}"
            }
        }
        it 'created a blood oxygen condition' do
            expect(JSON.parse(response.body)['message']).to eq('Data Blood Oxygen Condition Added')
        end
        it 'return status code 201' do
            expect(response).to have_http_status(201)
        end
    end
  end

  describe 'PUT /api/blood_oxygen_conditions/:id' do
    context 'when the record does not exist' do
        before { 
            put "/api/blood_oxygen_conditions/#{10000000}", headers: {
                Authorization: "Bearer #{authorizeAdmin}"
              }
        }
        it 'return status code ' do
            expect(response).to have_http_status(404)
            expect(JSON.parse(response.body)['status']).to match("failed")
        end
    end
    context 'when the record exists but update with record already exist' do
        before { 
            put "/api/blood_oxygen_conditions/#{blood_oxygen_condition_id}", 
            params: {
                "blood_oxygen_condition":{
                    "name":blood_oxygen_condition2_name
                }
            },
            headers: {
                Authorization: "Bearer #{authorizeAdmin}"
            }
        }
        it 'updated the record & return status code 422' do
            expect(JSON.parse(response.body)['message']['name'][0]).to match("has already been taken")
            expect(response).to have_http_status(422)
        end
    end
    context 'when the record exists' do
        before { 
            put "/api/blood_oxygen_conditions/#{blood_oxygen_condition_id}", 
            params: {
                "blood_oxygen_condition":{
                    "name":"olahraga"
                }
            },
            headers: {
                Authorization: "Bearer #{authorizeAdmin}"
            }
        }
        it 'updated the record & return status code 204' do
            expect(response).to have_http_status(204)
        end
    end
  end

  describe 'DELETE /api/blood_oxygen_conditions/:id' do
    context 'when the record does not exist' do
        before { 
            delete "/api/blood_oxygen_conditions/#{10000000}", headers: {
                Authorization: "Bearer #{authorizeAdmin}"
              }
        }
        it 'return status code ' do
            expect(response).to have_http_status(404)
            expect(JSON.parse(response.body)['status']).to match("failed")
        end
    end
    context 'when the record exists' do
        before { 
            delete "/api/blood_oxygen_conditions/#{blood_oxygen_condition_id}", headers: {
                Authorization: "Bearer #{authorizeAdmin}"
              }
        }
        it 'return status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end
end
