require 'rails_helper'

RSpec.describe "LabMeasurementsController", type: :request do
	let!(:lab_measurements) { create_list(:tb_lab_measurement, 5) }
    let(:lab_measurement_id) { lab_measurements.first.id }

    describe 'GET /api/lab_measurements' do
        before { 
            get "/api/lab_measurements", headers: {
                Authorization: "Bearer #{authorizeAdmin}"
            } 
        }
        it 'return the categories' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body).size).to eq(5)
        end
        
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'GET /api/lab_measurements/:id' do
        before { 
            get "/api/lab_measurements/#{lab_measurement_id}", 
            headers: {
                Authorization: "Bearer #{authorizeAdmin}"
            } 
        }
    
        context 'when the record does not exist' do
            let(:lab_measurement_id) { 10 }
            it 'return status code 404' do
                expect(response).to have_http_status(404)
            end
            it 'return message not found' do
                expect(JSON.parse(response.body)['message']).to match("Couldn't find TbLabMeasurement with 'id'=10")
            end
        end
    
        context 'when the record exists' do
            it 'return the category' do
                expect(JSON.parse(response.body)).not_to be_empty
                expect(JSON.parse(response.body)['id']).to eq(lab_measurement_id)
            end
        
            it 'return status code 200' do
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'POST /api/lab_measurements' do
        context 'the request is invalid' do
            before { 
                post "/api/lab_measurements", 
                params: { name: nil }, 
                headers: {
                    Authorization: "Bearer #{authorizeAdmin}"
                } 
            }
            it 'return status code 422' do
                expect(response).to have_http_status(422)
            end
            it 'return a validation failure message' do
                expect(JSON.parse(response.body)['message']).to match("Validation failed: Name can't be blank")
            end
        end

        context 'the request is valid' do
            before { 
                post "/api/lab_measurements", 
                params: { name: 'Inactivated vaccines' }, 
                headers: {
                    Authorization: "Bearer #{authorizeAdmin}"
                } 
            }
            it 'created a category' do
                expect(JSON.parse(response.body)['name']).to eq('Inactivated vaccines')
            end
            it 'return status code 201' do
                expect(response).to have_http_status(201)
            end
        end
    end
    
	describe 'PUT /api/lab_measurements/:id' do
        context 'when the record exists' do
            before { 
                put "/api/lab_measurements/#{lab_measurement_id}", 
                params: { 
                    name: 'Toxoid vaccines' 
                }, headers: {
                    Authorization: "Bearer #{authorizeAdmin}"
                } 
            }
            it 'updated the record & return status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    describe 'DELETE /api/lab_measurements/:id' do
        context 'when the record does not exist' do
            before { 
                delete "/api/lab_measurements/1000", 
                headers: {
                    Authorization: "Bearer #{authorizeAdmin}"
                } 
            }
            it 'return status code ' do
                expect(response).to have_http_status(404)
                expect(JSON.parse(response.body)['message']).to match("Couldn't find TbLabMeasurement with 'id'=1000")
            end
        end
        context 'when the record exists' do
            before { 
                delete "/api/lab_measurements/#{lab_measurement_id}", 
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
