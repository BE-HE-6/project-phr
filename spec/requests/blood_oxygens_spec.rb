require 'rails_helper'

RSpec.describe "BloodOxygens", type: :request do
  let(:blood_oxygens) { create_list(:tb_blood_oxygen, 5) }
  let(:blood_oxygen_id) { blood_oxygens.first.id }

  # describe "GET /create" do
  #   it "returns http success" do
  #     get "/blood_oxygens/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST /api/blood_oxygens" do
    context 'the request is valid' do
      it 'insert a blood oxygen data' do
          post '/api/blood_oxygens', params: {
            "data":{
                "blood_oxygen":99,
                "note":"Test 1",
                "user_id":1
            }
        }
          expect(response).to have_http_status(201)
      end
  end
  end

  describe "GET /api/blood_oxygens" do
    before { get '/api/blood_oxygens' }
    it 'return vaccines' do
        json_result = JSON.parse(response.body)
        puts json_result
        #expect(json_result[:data]).not_to be_empty
        #expect(json_result[:data].size).to eq(5)
    end
    
    it 'return status code 200' do
        expect(response).to have_http_status(200)
    end
  end

  # describe "GET /destroy" do
  #   it "returns http success" do
  #     get "/blood_oxygens/destroy"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/blood_oxygens/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /index" do
  #   it "returns http success" do
  #     get "/blood_oxygens/index"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
