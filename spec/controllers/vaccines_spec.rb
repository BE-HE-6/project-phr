require 'rails_helper'

RSpec.describe "VaccinesController", type: :request do
    let!(:users) {create_list(:user, 5)}
    let!(:authorize) {authorizeUser(users.first.email, 'Examples20#')}

    let!(:vaccine_categories) { create_list(:TbVaccineCategory, 5) }
    let!(:vaccines) { create_list(:TbVaccine, 5) }
    let(:vaccine_id) { vaccines.first.id }

    describe "GET /api/vaccines" do
        before { 
            get "/api/vaccines", headers: {
                Authorization: "Bearer #{authorize}"
            } 
        }
        it 'return vaccines' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body).size).to eq(5)
        end
        
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'GET /api/vaccines/:id' do
        before { 
            get "/api/vaccines/#{vaccine_id}", 
            headers: {
                Authorization: "Bearer #{authorize}"
            } 
        }
        context 'when the record does not exist' do
            let(:vaccine_id) { 100 }
            it 'return status code 404' do
                expect(response).to have_http_status(404)
                expect(JSON.parse(response.body)['message']).to match("Couldn't find TbVaccine with 'id'=100")
            end
        end

        context 'when the record exists' do
            it 'return the item category' do
                expect(JSON.parse(response.body)).not_to be_empty
                expect(JSON.parse(response.body)['id']).to eq(vaccine_id)
            end
            it 'return status code 200' do
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'POST /api/vaccines' do
        context 'the request is invalid' do
            it "name can't be blank" do
                post "/api/vaccines/", params: { 
                    name: nil,
                    location: 'Kota Bekasi',
                    vaccine_category_id: Faker::Number.between(from: 1, to: 5)
                }, headers: {
                    Authorization: "Bearer #{authorize}"
                }
                expect(response).to have_http_status(422)
                expect(JSON.parse(response.body)['message']).to match("Validation failed: Name can't be blank")
            end
            it "location can't be blank" do
                post "/api/vaccines/", params: { 
                    name: 'Inactivated vaccines',
                    location: nil,
                    vaccine_category_id: Faker::Number.between(from: 1, to: 5)
                }, headers: {
                    Authorization: "Bearer #{authorize}"
                }
                expect(response).to have_http_status(422)
                expect(JSON.parse(response.body)['message']).to match("Validation failed: Location can't be blank")
            end
            it "vaccine category id can't be blank" do
                post "/api/vaccines/", params: { 
                    name: 'Inactivated vaccines',
                    location: 'Kota Bekasi',
                    vaccine_category_id: nil
                }, headers: {
                    Authorization: "Bearer #{authorize}"
                }
                expect(response).to have_http_status(422)
                expect(JSON.parse(response.body)['message']).to match("Validation failed: Tb vaccine category must exist, Vaccine category can't be blank, Vaccine category is not a number")
            end
        end

        context 'the request is valid' do
            it 'created a vaccine' do
                post "/api/vaccines/", params: { 
                    name: 'Inactivated vaccines',
                    location: 'Kota Bekasi',
                    vaccine_category_id: Faker::Number.between(from: 1, to: 5)
                }, headers: {
                    Authorization: "Bearer #{authorize}"
                }
                expect(response).to have_http_status(201)
            end
        end
    end

    describe 'DELETE /api/vaccines/:id' do
        context 'when the record does not exist' do
            before { 
                delete "/api/vaccines/1000", 
                headers: {
                    Authorization: "Bearer #{authorize}"
                } 
            }
            it 'return status code ' do
                expect(response).to have_http_status(404)
                expect(JSON.parse(response.body)['message']).to match("Couldn't find TbVaccine with 'id'=1000")
            end
        end
        context 'when the record exists' do
            before { 
                delete "/api/vaccines/#{vaccine_id}", 
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
