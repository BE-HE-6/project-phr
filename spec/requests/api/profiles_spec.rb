require 'rails_helper'

RSpec.describe "Api::Profiles", type: :request do
  let(:profile_id) { users.first.id }
  let(:user) { FactoryBot.create(
    name: "New User",
    birth_place: "Jogyakarta",
    birth_date: "2022-12-12",
    blood_type: "AB",
    bpjs_id: "00127295921",
    ktp_id: "3673033607930003"
    )
  }
  describe "GET /api/profiles/:id" do
    before { get "api/profiles/#{profile_id}" }

    context "when the record does not exist status code 404" do
      let(:profile_id) { 400 }
      it "return status code 404" do
        expect(response).to have_http_status(404)
      end

      it "return message not found" do
        expect(JSON.parse(response.body)['message']).to match("id 400 could not be found")
      end
    end

    context "when the record exist status code 200" do
      it "return the category" do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(profile_id)
      end

      it "return status code 200" do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "PUT /api/profiles/:id" do
    context "when the record exists" do
      before { put "/api/profiles/#{profile_id}", params: {
          name: name,
          birth_place: birth_place,
          birth_date: birth_date,
          blood_type: blood_type,
          bpjs_id: bpjs_id,
          ktp_id: ktp_id
        }
      }
      it "record has been updated successfully." do
        expect(response.body).to be_empty
      end
      it "return status code 204" do
        expect(response).to have_http_status(204)
      end

    end
  end
end