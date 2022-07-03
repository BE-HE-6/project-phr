require 'rails_helper'

RSpec.describe "BloodGlucoses", type: :request do
    let!(:users) {create_list(:user, 5)}
    let!(:blood_glucose_condition) { create_list(:tb_blood_glucose_condition,3) }
    let!(:blood_glucoses) { create_list(:tb_blood_glucose, 3) }
    let(:blood_glucose_id) { blood_glucoses.first.id }
  
    describe "GET /api/blood_glucoses" do
      before { get '/api/blood_glucoses', headers: {
        Authorization: "Bearer #{authorize}"
      } }
      it 'return blood glucoses' do
          json_result = JSON.parse(response.body)
  
          expect(json_result["data"]).not_to be_empty
          expect(json_result["data"].size).to eq(3)
      end
      
      it 'return status code 200' do
          expect(response).to have_http_status(200)
      end
    end
  
    describe 'GET /api/blood_glucoses/:id' do
      before { 
          get "/api/blood_glucoses/#{blood_glucose_id}", headers: {
            Authorization: "Bearer #{authorize}"
          }
      }
      context 'when the record does not exist' do
        let(:blood_glucose_id) { 100000 }
          it 'return status code 404' do
              expect(response).to have_http_status(404)
              expect(JSON.parse(response.body)['message']).to match("data not found")
          end
      end
  
      context 'when the record exists' do
          it 'return the item category' do
              expect(JSON.parse(response.body)).not_to be_empty
              expect(JSON.parse(response.body)['data']['id']).to eq(blood_glucose_id)
          end
          it 'return status code 200' do
              expect(response).to have_http_status(200)
          end
      end
    end
  
    describe "POST /api/blood_glucoses" do
      context 'the request is invalid' do
        it "blood glucose can't be blank" do
            post '/api/blood_glucoses', 
            params: {
              "data": {
                  "blood_glucose":nil,
                  "note":"Test 1",
                  "user_id":1,
                  "blood_glucose_condition_id":Faker::Number.between(from: 1, to: 3)
              }
            },
            headers: {
              Authorization: "Bearer #{authorize}"
            }
            expect(response).to have_http_status(422)
            expect(JSON.parse(response.body)['errors']['blood_glucose'][0]).to match("can't be blank")
        end
  
        it "user id can't be blank" do
          post '/api/blood_glucoses', 
          params: {
            "data":{
                "blood_glucose":90,
                "note":"Test 1",
                "user_id": nil,
                "blood_glucose_condition_id":Faker::Number.between(from: 1, to: 3)
            }
          },
          headers: {
            Authorization: "Bearer #{authorize}"
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['errors']['user_id'][0]).to match("can't be blank")
        end
  
        it "blood glucose condition id can't be blank" do
          post '/api/blood_glucoses', params: {
            "data":{
                "blood_glucose":90,
                "note":"Test 1",
                "user_id":2,
                "blood_glucose_condition_id":nil
            }
          },
          headers: {
            Authorization: "Bearer #{authorize}"
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['errors']['blood_glucose_condition_id'][0]).to match("can't be blank")
        end
      end
      context 'the request is valid' do
        it 'insert a blood glucose data' do
            post '/api/blood_glucoses', params: {
              "data":{
                  "blood_glucose":80,
                  "note":"Test 1",
                  "user_id":1,
                  "blood_glucose_condition_id":Faker::Number.between(from: 1, to: 3)
              }
            },
            headers: {
              Authorization: "Bearer #{authorize}"
            }
            expect(response).to have_http_status(201)
        end
      end
    end
  
    describe 'DELETE /api/blood_glucoses/:id' do
      context 'when the record does not exist' do
          before { 
              delete "/api/blood_glucoses/#{1000000}", headers: {
                Authorization: "Bearer #{authorize}"
              }
          }
          it 'return status code ' do
              expect(response).to have_http_status(404)
              expect(JSON.parse(response.body)['message']).to match("data not found")
          end
      end
      context 'when the record exists' do
          before { 
              delete "/api/blood_glucoses/#{blood_glucose_id}",
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
