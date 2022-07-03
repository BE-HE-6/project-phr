require 'rails_helper'

RSpec.describe "Api::Profiles", type: :request do
  let!(:users) {create_list(:user, 5)}
  let!(:profile_id) { users.first.id }

  describe "GET /api/profiles/:id" do

    context "when the record does not exist status code 401" do
      before { 
        get "/api/profiles/#{profile_id}"
      }
      let(:profile_id) { 400 }
      it "return status code 401" do
        expect(response).to have_http_status(401)
      end

      it "return message not found" do
        expect(JSON.parse(response.body)['message']).to match("You have to log in")
      end
    end

    context "when the record exist status code 200" do
      before { 
        get "/api/profiles/#{profile_id}", headers: {
          Authorization: "Bearer #{authorize}"
        }
      }
      it "return the profile" do
        expect(JSON.parse(response.body)).not_to be_empty
      end
      
      it "return status code 200" do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "PUT /api/profiles/:id" do
    context "when the record exists" do
      before { 
        put "/api/profiles/#{profile_id}", params: {
          profile: {
            email: "user20@gmail.com",
            password: "Examples20#",
            name: "User20",
            birth_place: "DKI Jakarta",
            birth_date: "2022-10-10",
            blood_type: "AB",
            bpjs_id: "00127295921",
            ktp_id: "3673033607930003" 
          }
        }, headers: {
          Authorization: "Bearer #{authorize}"
        }
      }

      it "record has been updated successfully." do
        expect(response.body).not_to be_empty
      end

      it "return status code 204" do
        expect(response).to have_http_status(200)
      end
    end
  end
end
