require 'rails_helper'

RSpec.describe "BodyWeightHeightController", type: :request do
  let!(:body_weight_height) { FactoryBot.create_list(:body_weight_height, 5) } 
  let!(:body_weight_height_id) {body_weight_height.first.id}

  describe "GET /api/body_weight_height" do
    before { get body_weight_height_index_path }
    it 'return BodyWeightHeight data' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'return HTTP status OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /api/body_weight_height/:id" do
      before { get body_weight_height_path(id: body_weight_height_id) }
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
      it "user_id can't be blank" do
        post "/api/body_weight_height", params: {
          user_id: nil,
          weight: 80.5,
          height: 157.5,
          note: "Thats note",
          bmi_calculation: 24.4,
          date_time: "29-10-2022 14:55:55"
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['message']).to match("Validation failed: User can't be blank, User is not a number")
      end

      it "weight can't be blank" do
        post "/api/body_weight_height", params: {
          user_id: 1,
          weight: nil,
          height: 157.5,
          note: "Thats note",
          bmi_calculation: 24.4,
          date_time: "29-10-2022 14:55:55"
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['message']).to match("Validation failed: Weight can't be blank")
      end

      it "height can't be blank" do
        post "/api/body_weight_height", params: {
          user_id: 1,
          weight: 80.5,
          height: nil,
          note: "Thats note",
          bmi_calculation: 24.4,
          date_time: "29-10-2022 14:55:55"
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['message']).to match("Validation failed: Height can't be blank")
      end

      it "date_time can't be blank" do
        post "/api/body_weight_height", params: {
          user_id: 1,
          weight: 80.5,
          height: 185.5,
          note: "Thats note",
          bmi_calculation: 24.4,
          date_time: nil
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['message']).to match("Validation failed: Date time can't be blank")
      end
    end
  end

  describe "DELETE /api/body_weight_height" do
    context 'when the record does not exist' do
      before { delete body_weight_height_path(id: '100') }
      it 'return HTTP status not_found' do
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['message']).to match("Couldn't find BodyWeightHeight with 'id'=100")
      end
    end

    context "when the record  exist" do
      before { delete body_weight_height_path(id: body_weight_height_id) }
      it 'return HTTP status no_content' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

end