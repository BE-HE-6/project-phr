require 'rails_helper'

RSpec.describe "BodyWeightHeightController", type: :request do
  let!(:users) {create_list(:user, 5)}
  let!(:authorize) {authorizeUser(users.first.email, 'Examples20#')}
  let!(:body_weight_height) { FactoryBot.create_list(:body_weight_height, 5) } 
  let!(:body_weight_height_id) {body_weight_height.first.id}

  describe "GET /api/body_weight_height" do
    before {
      get body_weight_height_index_path, headers: {
        Authorization: "Bearer #{authorize}",
    } }
    it 'return BodyWeightHeight data' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'return HTTP status OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /api/body_weight_height/:id" do
      before { get body_weight_height_path(id: body_weight_height_id), headers: {
        Authorization: "Bearer #{authorize}",

      } }
      context 'when the record does not exist' do
        let(:body_weight_height_id) { 100 }
        it 'return HTTP status not_found' do
          expect(response).to have_http_status(:not_found)
          expect(JSON.parse(response.body)['message']).to match("Couldn't find BodyWeightHeight with 'id'=100")
        end
      end

      context 'when the record does exist' do
        it 'return HTTP status OK' do
          expect(response).to have_http_status(:ok)
        end

        it 'return BodyWeightHeight data' do
          expect(JSON.parse(response.body)).not_to be_empty
          expect(JSON.parse(response.body)['id']).to eq(body_weight_height_id)
        end
      end
      
  end

  describe 'POST /api/body_weight_height' do
    context 'the request is invalid' do
      it "weight can't be blank" do
        post "/api/body_weight_height", params: {
          weight: nil,
          height: 157.5,
          note: "Thats note",
          bmi_calculation: 24.4,
          date_time: "29-10-2022 14:55:55"
        }, headers: {
          Authorization: "Bearer #{authorize}"
        }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['message']).to match("Validation failed: Weight can't be blank")
      end

      it "height can't be blank" do
        post "/api/body_weight_height", params: {
          weight: 80.5,
          height: nil,
          note: "Thats note",
          bmi_calculation: 24.4,
          date_time: "29-10-2022 14:55:55"
        }, headers: {
          Authorization: "Bearer #{authorize}"
        }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['message']).to match("Validation failed: Height can't be blank")
      end

      it "date_time can't be blank" do
        post "/api/body_weight_height", params: {
          weight: 80.5,
          height: 185.5,
          note: "Thats note",
          bmi_calculation: 24.4,
          date_time: nil
        }, headers: {
          Authorization: "Bearer #{authorize}"
        }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['message']).to match("Validation failed: Date time can't be blank")
      end
    end
    it "the request is valid" do
      post "/api/body_weight_height", params: {
        weight: 80.5,
        height: 157.5,
        note: "Thats note",
        bmi_calculation: 24.4,
        date_time: "29-10-2022 14:55:55"
      }, headers: {
        Authorization: "Bearer #{authorize}"
      }
      expect(response).to have_http_status(201)
    end
  end

  describe "DELETE /api/body_weight_height" do
    context 'when the record does not exist' do
      before { delete body_weight_height_path(id: '100'), headers: {
        Authorization: "Bearer #{authorize}"
      } }
      it 'return HTTP status not_found' do
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['message']).to match("Couldn't find BodyWeightHeight with 'id'=100")
      end
    end

    context "when the record exist" do
      before { delete body_weight_height_path(id: body_weight_height_id), headers: {
        Authorization: "Bearer #{authorize}"
      } }
      it 'return HTTP status no_content' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

end
