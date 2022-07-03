require 'rails_helper'

RSpec.describe "BloodPressures", type: :request do
  let!(:blood_pressure_condition) { FactoryBot.create_list(:blood_pressure_condition, 5) }
  let!(:blood_pressure) { FactoryBot.create_list(:blood_pressure, 5)}
  let!(:blood_pressure_id) { blood_pressure.first.id }

  describe "CREATE /api/blood_pressure" do
    before { get blood_pressure_index_path }
    it 'return blood pressure' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'return HTTP status OK' do
      expect(response).to have_http_status(:ok) 
    end
  end

  describe "GET  /api/blood_pressure/:id" do
    before { get blood_pressure_path(id: blood_pressure_id)}
    context "when the record deosn't exist" do
      let(:blood_pressure_id) { 99 }
      it 'return HTTP status not_found'do
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['message']).to match("Couldn't find BloodPressure with 'id'=99")
      end
    end

    context "when the record does exist" do
      it 'return HTTP status OK' do
        expect(response).to have_http_status(:ok) 
      end

      it 'return blood_pressure data' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(blood_pressure_id)
      end
    end
    
  end

  describe "POST /api/blood_pressure" do
    context "the request is invalid" do
      it "user_id can't be blank" do
        post '/api/blood_pressure', params: {
          user_id: nil,
          blood_pressure_condition_id: Faker::Number.between(from: 1, to: 4),
          sistole: 120,
          diastole: 80,
          pulse: 90,
          note: 'Thats my note',
          date_time: '14-04-2022 14:55:23'
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to match("Validation failed: User can't be blank, User is not a number")
      end

      it "blood_pressure_condition can't be blank" do
        post '/api/blood_pressure', params: {
          user_id: 1,
          blood_pressure_condition_id: nil,
          sistole: 120,
          diastole: 80,
          pulse: 90,
          note: 'Thats my note',
          date_time: '14-04-2022 14:55:23'
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to match("Blood pressure condition must exist, Blood pressure condition can't be blank, Blood pressure condition is not a number")
      end

      it "sistole can't be blank" do
        post '/api/blood_pressure', params: {
          user_id: 1,
          blood_pressure_condition_id: 2,
          sistole: nil,
          diastole: 80,
          pulse: 90,
          note: 'Thats my note',
          date_time: '14-04-2022 14:55:23'
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to match("Sistole can't be blank")
      end

      it "diastole can't be blank" do
        post '/api/blood_pressure', params: {
          user_id: 1,
          blood_pressure_condition_id: 2,
          sistole: 120,
          diastole: nil,
          pulse: 90,
          note: 'Thats my note',
          date_time: '14-04-2022 14:55:23'
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to match("Diastole can't be blank")
      end

      it "pulse can't be blank" do
        post '/api/blood_pressure', params: {
          user_id: 1,
          blood_pressure_condition_id: 2,
          sistole: 120,
          diastole: 80,
          pulse: nil,
          note: 'Thats my note',
          date_time: '14-04-2022 14:55:23'
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to match("Pulse can't be blank")
      end

      it "date_time can't be blank" do
        post '/api/blood_pressure', params: {
          user_id: 1,
          blood_pressure_condition_id: 2,
          sistole: 120,
          diastole: 80,
          pulse: 90,
          note: 'Thats my note',
          date_time: nil
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['message']).to match("Validation failed: Date time can't be blank")
      end
    end

    context "the request is valid" do
      it 'create a blood pressure data' do
        post '/api/blood_pressure', params: {
          user_id: 3,
          blood_pressure_condition_id: Faker::Number.between(from: 1, to: 4),
          sistole: 120,
          diastole: 80,
          pulse: 90,
          note: 'Thats my note',
          date_time: '14-04-2022 14:55:23'
        }
        expect(response).to have_http_status(:created) 
      end
    end
  end

  describe "DESTROY /api/blood_pressure" do
    context 'when the record does not exist' do
      before {delete blood_pressure_path(id: 100)}
      it 'return HTTP status not_found' do
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['message']).to match("Couldn't find BloodPressure with 'id'=100")
      end
    end

    context 'when the record does exist' do
      before {delete blood_pressure_path(id: blood_pressure_id)}
      it 'return HTTP status no_content' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
  
end
