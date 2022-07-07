require 'rails_helper'

RSpec.describe "JoinLabMeasurements", type: :request do
  let!(:lab_result_categories) { create_list(:tb_lab_result_category, 5) }
  let(:lab_result_category_id) { lab_result_categories.first.id }

  let!(:lab_measurements) { create_list(:tb_lab_measurement, 5) }
  let(:lab_measurement_id) { lab_measurements.first.id }

  let!(:lab_result) { create_list(:tb_lab_result, 5) }
  let!(:lab_result_id) { lab_result.first.id }

  let!(:join_lab_measurement) {create_list(:tb_join_lab_measurement, 5)}
  let!(:join_lab_measurement_id) {join_lab_measurement.first.id}

  describe 'GET /api/join_lab_measurements' do
    before { 
        get "/api/join_lab_measurements", headers: {
            Authorization: "Bearer #{authorizeAdmin}"
        } 
    }
    it 'return join lab measurement' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body).size).to eq(5)
    end
    
    it 'return status code 200' do
        expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/join_lab_measurements/:id' do
    before { 
        get "/api/join_lab_measurements/#{join_lab_measurement_id}", 
        headers: {
            Authorization: "Bearer #{authorizeAdmin}"
        } 
    }

    context 'when the record does not exist' do
        let(:join_lab_measurement_id) { 100 }
        it 'return status code 404' do
            expect(response).to have_http_status(404)
        end
        it 'return message not found' do
            expect(JSON.parse(response.body)['message']).to match("Couldn't find TbJoinLabMeasurement with 'id'=100")
        end
    end

    context 'when the record exists' do
        it 'return the category' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body)['id']).to eq(join_lab_measurement_id)
        end
    
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end
  end

  describe 'POST /api/join_lab_measurements' do
    context 'the request is invalid' do
      it "value can't be blank" do
          post "/api/join_lab_measurements", params: { 
              value: nil,
              result_id: Faker::Number.between(from: 1, to: 5),
              measurement_id: Faker::Number.between(from: 1, to: 5)
          }, headers: {
              Authorization: "Bearer #{authorizeAdmin}"
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['message']).to match("Validation failed: Value can't be blank")
      end

      it "result_id can't be blank" do
        post "/api/join_lab_measurements", params: { 
            value: "Value score",
            result_id: nil,
            measurement_id: Faker::Number.between(from: 1, to: 5)
        }, headers: {
            Authorization: "Bearer #{authorizeAdmin}"
        }
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['message']).to match("Validation failed: Tb lab result must exist, Result can't be blank, Result is not a number")
      end

      it "measurement_id can't be blank" do
        post "/api/join_lab_measurements", params: { 
            value: nil,
            result_id: Faker::Number.between(from: 1, to: 5),
            measurement_id: nil
        }, headers: {
            Authorization: "Bearer #{authorizeAdmin}"
        }
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['message']).to match("Validation failed: Tb lab measurement must exist, Measurement can't be blank, Measurement is not a number, Value can't be blank")
      end
    end

    context 'the request is valid' do
      it 'created a lab result' do
            post "/api/join_lab_measurements", params: { 
              value: "Value measurement",
              result_id: Faker::Number.between(from: 1, to: 5),
              measurement_id: Faker::Number.between(from: 1, to: 5)
          }, headers: {
              Authorization: "Bearer #{authorizeAdmin}"
          }
          expect(response).to have_http_status(201)
      end
    end
  
  end

  describe 'DELETE /api/join_lab_measurements/:id' do
    context 'when the record does not exist' do
        before { 
            delete "/api/join_lab_measurements/1000", 
            headers: {
                Authorization: "Bearer #{authorizeAdmin}"
            }
        }
        it 'return status code ' do
            expect(response).to have_http_status(404)
            expect(JSON.parse(response.body)['message']).to match("Couldn't find TbJoinLabMeasurement with 'id'=1000")
        end
    end
    
    context 'when the record exists' do
        before { 
            delete "/api/join_lab_measurements/#{join_lab_measurement_id}", 
            headers: {
                Authorization: "Bearer #{authorizeAdmin}"
            }
        }
        it 'return status code 204' do
            expect(response).to have_http_status(204)
        end
    end
  end

end
