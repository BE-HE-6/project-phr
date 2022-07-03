require 'rails_helper'

RSpec.describe "BloodPressureConditions", type: :request do
  let!(:blood_pressure_condition) { FactoryBot.create_list(:blood_pressure_condition, 5) }
  let!(:blood_pressure_condition_id) { blood_pressure_condition.first.id } 

  describe "GET /api/blood_pressure_condition" do
    before { get blood_pressure_condition_index_path, headers: {
      Authorization: "Bearer #{authorize}"
    } }
    it 'return all blood pressure condition' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'return http status success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /api/blood_pressure_condition:id" do
    before { get blood_pressure_condition_path(id: blood_pressure_condition_id), headers: {
      Authorization: "Bearer #{authorize}"
    } }
    context 'when the record does not exist' do
      let(:blood_pressure_condition_id) { 10 }
      it 'return http status not_found' do
        expect(response).to have_http_status(:not_found)
      end

      it 'return message not found' do
        expect(JSON.parse(response.body)['message']).to match("Couldn't find BloodPressureCondition with 'id'=10")
      end
    end

    context 'when the record does exist' do
      it 'return the blood pressure condition' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(blood_pressure_condition_id)
      end

      it 'return http status success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST /api/blood_pressure_condition" do
    context "the request is invalid" do
      before { post blood_pressure_condition_index_path, params: {name: nil}, headers: {
        Authorization: "Bearer #{authorize}"
      }}
      it 'return status code unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
      
      it 'return a validation failure message' do
        expect(JSON.parse(response.body)['message']).to match("Validation failed: Name can't be blank")
      end
    end

    context "the request is valid" do
      before { post blood_pressure_condition_index_path, params: { name: 'Wake Up' }}
      it 'created a blood pressure condition' do
        expect(JSON.parse(response.body)['name']).to eq('Wake Up')
      end
      it 'return http status created' do
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe "PUT /api/blood_pressure_condition/:id" do
    context "when the record exist" do
      before { put "/api/blood_pressure_condition/#{blood_pressure_condition_id}", params: { name: 'Stressed' }, headers: {
        Authorization: "Bearer #{authorize}"
      } }
      it 'update the record' do
        expect(response.body).to be_empty
      end
      it 'return http status code no_content' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe "DELETE /api/blood_pressure_condition/:id" do
    context "when the record doesn't exist" do
      before { delete "/api/blood_pressure_condition/100", headers: {
        Authorization: "Bearer #{authorize}"
      } }
      it 'return http status not_found' do
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['message']).to match("Couldn't find BloodPressureCondition with 'id'=100")
      end
    end

    context "when the record does exist" do
      before {delete "/api/blood_pressure_condition/#{blood_pressure_condition_id}"}
      it 'return status code not_found' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
  
end
