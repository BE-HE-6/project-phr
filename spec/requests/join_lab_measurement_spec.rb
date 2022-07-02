require 'rails_helper'

RSpec.describe "JoinLabMeasurements", type: :request do
  let!(:lab_measurement) { create_list(:TbLabMeasurement, 5) }
  let!(:join_lab_measurement) { create_list(:TbJoinLabMeasurement, 5) }
  let(:join_lab_measurement_id) { join_lab_measurement.first.id }

  describe "GET /api/join_lab_measurement" do
    before { get '/api/join_lab_measurement' }
    # it 'return join_lab_measurement' do
    #     expect(JSON.parse(response.body)).not_to be_empty
    #     expect(JSON.parse(response.body).size).to eq(5)
    # end

    # it 'return status code 200' do
    #     expect(response).to have_http_status(200)
    # end
  end

  describe 'GET /api/join_lab_measurement/:id' do
    before { get "/api/join_lab_measurement/#{join_lab_measurement_id}" }
    context 'when the record does not exist' do
        let(:join_lab_measurement) { 100 }

    #     it 'return status code 404' do
    #         expect(response).to have_http_status(404)
    #         expect(JSON.parse(response.body)['message']).to match("Couldn't find TbJoinLabMeasurement with 'id'=100")
    #     end
    end

    context 'when the record exists' do
    #     it 'return the item category' do
    #         expect(JSON.parse(response.body)).not_to be_empty
    #         expect(JSON.parse(response.body)['id']).to eq(join_lab_measurement_id)
    #     end

    #     it 'return status code 200' do
    #         expect(response).to have_http_status(200)
    #     end
    end
  end

  describe 'POST /api/join_lab_measurement' do
    context 'the request is invalid' do
        it "value can't be blank" do
            post '/api/join_lab_measurement', params: { 
                value: nil,
                lab_measurement_id: Faker::Number.between(from: 1, to: 5),
                lab_result_id: Faker::Number.between(from: 1, to: 5),
                lab_result_tb_user_id: 1,
                lab_result_tb_lab_result_category_id: 1
            }
            expect(response).to have_http_status(422)
            expect(JSON.parse(response.body)['message']).to match("Validation failed: Value can't be blank")
        end
        it "lab_measurement_id can't be blank" do
          post '/api/join_lab_measurement', params: { 
              value: 100,
              lab_measurement_id: nil,
              lab_result_id: Faker::Number.between(from: 1, to: 5),
              lab_result_tb_user_id: 1,
              lab_result_tb_lab_result_category_id: 1
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['message']).to match("Validation failed: lab_measurement_id can't be blank")
        end
        it "lab_result_id can't be blank" do
          post '/api/join_lab_measurement', params: { 
              value: 100,
              lab_measurement_id: Faker::Number.between(from: 1, to: 5),
              lab_result_id: nil,
              lab_result_tb_user_id: 1,
              lab_result_tb_lab_result_category_id: 1
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['message']).to match("Validation failed: lab_result_id can't be blank")
        end
        it "lab_result_tb_user_id can't be blank" do
          post '/api/join_lab_measurement', params: { 
              value: 100,
              lab_measurement_id: Faker::Number.between(from: 1, to: 5),
              lab_result_id: Faker::Number.between(from: 1, to: 5),
              lab_result_tb_user_id: nil,
              lab_result_tb_lab_result_category_id: 1
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['message']).to match("Validation failed: lab_result_tb_user_id can't be blank")
        end
        it "lab_result_tb_lab_result_category_id can't be blank" do
          post '/api/join_lab_measurement', params: { 
              value: 100,
              lab_measurement_id: Faker::Number.between(from: 1, to: 5),
              lab_result_id: Faker::Number.between(from: 1, to: 5),
              lab_result_tb_user_id: Faker::Number.between(from: 1, to: 5),
              lab_result_tb_lab_result_category_id: nil
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['message']).to match("Validation failed: lab_result_tb_lab_result_category_id can't be blank")
        end
    end

    context 'the request is valid' do
        it 'created a join lab measurement' do
            post '/api/join_lab_measuremnt', params: {  
                value: 100,
                lab_measurement_id: Faker::Number.between(from: 1, to: 5),
                lab_result_id: 1,
                lab_result_tb_user_id: 1,
                lab_result_tb_lab_result_category_id: 1
            } 
            expect(response).to have_http_status(201)
        end
    end
  end
end
