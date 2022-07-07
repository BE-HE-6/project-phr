require 'rails_helper'

RSpec.describe "LabResults", type: :request do
  let!(:users) {create_list(:user, 5)}
  let!(:authorize) {authorizeUser(users.first.email, 'Examples20#')}

  let!(:lab_result_categories) { create_list(:tb_lab_result_category, 5) }
  let(:lab_result_category_id) { lab_result_categories.first.id }

  let!(:lab_result) { create_list(:tb_lab_result, 5) }
  let!(:lab_result_id) { lab_result.first.id }
  
  describe "GET /api/lab_results" do
    before { 
            get lab_results_path, headers: {
                Authorization: "Bearer #{authorize}"
            } 
        }
    it 'return lab_result' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'return HTTP status code ok' do
      expect(response).to have_http_status(:ok)
    end 
  end

  describe 'GET /api/lab_results/:id' do
    before { 
        get "/api/lab_results/#{lab_result_id}", 
        headers: {
            Authorization: "Bearer #{authorize}"
        } 
    }

    context 'when the record does not exist' do
        let(:lab_result_id) { 10 }
        it 'return status code 404' do
            expect(response).to have_http_status(404)
        end

        it 'return message not found' do
            expect(JSON.parse(response.body)['message']).to match("Couldn't find TbLabResult with 'id'=10")
        end
    end

    context 'when the record exists' do
        it 'return the lab_results' do
            expect(JSON.parse(response.body)).not_to be_empty
            expect(JSON.parse(response.body)['id']).to eq(lab_result_id)
        end
    
        it 'return status code 200' do
            expect(response).to have_http_status(200)
        end
    end
  end

  describe 'POST /api/lab_results' do
    context 'the request is invalid' do
      it "name can't be blank" do
          post "/api/lab_results", params: { 
              name: nil,
              doc: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
              result_category_id: Faker::Number.between(from: 1, to: 5),
              result_note: "Thats my note",
              date_time: "20-05-2022 14:55:20"
          }, headers: {
              Authorization: "Bearer #{authorize}"
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['message']).to match("Validation failed: Name can't be blank")
      end

      it "Document Upload can't be blank" do
            post "/api/lab_results", params: { 
              name: "Lab Rotojoyo",
              doc: "",
              result_category_id: Faker::Number.between(from: 1, to: 5),
              result_note: "Thats my note",
              date_time: "20-05-2022 14:55:20"
          }, headers: {
              Authorization: "Bearer #{authorize}"
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['message']).to match("Validation failed: Doc can't be blank")
      end

      it "lab result category id can't be blank" do
            post "/api/lab_results", params: { 
              name: "Lab Rotojoyo",
              doc: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
              result_category_id: nil,
              result_note: "Thats my note",
              date_time: "20-05-2022 14:55:20"
            }, headers: {
              Authorization: "Bearer #{authorize}"
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['message']).to match("Validation failed: Tb lab result category must exist")
      end

      it "lab result category must exist" do
          post "/api/lab_results", params: { 
              name: "Lab Rotojoyo",
              doc: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
              result_category_id: 1000,
              result_note: "Thats my note",
              date_time: "20-05-2022 14:55:20"
            }, headers: {
              Authorization: "Bearer #{authorize}"
          }
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)['message']).to match("Validation failed: Tb lab result category must exist")
      end
    end

    context 'the request is valid' do
      it 'created a lab result' do
        post "/api/lab_results", params: { 
              name: "Lab Rotojoyo",
              doc: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))),
              result_category_id: Faker::Number.between(from: 1, to: 5),
              result_note: "Thats my note",
              date_time: "20-05-2022 14:55:20"
          }, headers: {
              Authorization: "Bearer #{authorize}"
          }
          expect(response).to have_http_status(201)
      end
    end
  
  end

  describe 'DELETE /api/lab_results/:id' do
    context 'when the record does not exist' do
        before { 
            delete "/api/lab_results/1000", 
            headers: {
                Authorization: "Bearer #{authorize}"
            }
        }
        it 'return status code ' do
            expect(response).to have_http_status(404)
            expect(JSON.parse(response.body)['message']).to match("Couldn't find TbLabResult with 'id'=1000")
        end
    end
    context 'when the record exists' do
        before { 
            delete "/api/lab_results/#{lab_result_id}", 
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