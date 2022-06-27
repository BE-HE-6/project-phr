require 'rails_helper'

RSpec.describe "Api::Registrations", type: :request do
  describe "POST /api/sign_up" do
    context "when request is invalid status code 422" do
      it "email can't be blank" do
        post '/api/sign_up', params: { email: nil,
                                       password_digest: "Examples20#",
                                       name: "User",
                                       birth_place: "Jakarta",
                                       birth_date: "2022-10-15",
                                       blood_type: "AB",
                                       bpjs_id: "00127295921",
                                       ktp_id: "00127295921" }
        expect(response).to have_http_status(422)
      end
      it "password can't be blank" do
        post '/api/sign_up', params: { email: "user@example.com",
                                       password_digest: nil,
                                       name: "User",
                                       birth_place: "Jakarta",
                                       birth_date: "2022-10-15",
                                       blood_type: "AB",
                                       bpjs_id: "00127295921",
                                       ktp_id: "00127295921" }
        expect(response).to have_http_status(422)
      end
      it "name can't be blank" do
        post '/api/sign_up', params: { email: "user@example.com",
                                       password_digest: "Examples20#",
                                       name: nil,
                                       birth_place: "Jakarta",
                                       birth_date: "2022-10-15",
                                       blood_type: "AB",
                                       bpjs_id: "00127295921",
                                       ktp_id: "00127295921" }
        expect(response).to have_http_status(422)
      end
      it "birth place can't be blank" do
        post '/api/sign_up', params: { email: "user@example.com",
                                       password_digest: "Examples20#",
                                       name: "User",
                                       birth_place: nil,
                                       birth_date: "2022-10-15",
                                       blood_type: "AB",
                                       bpjs_id: "00127295921",
                                       ktp_id: "00127295921" }
        expect(response).to have_http_status(422)
      end
      it "birth date can't be blank" do
        post '/api/sign_up', params: { email: "user@example.com",
                                       password_digest: "Examples20#",
                                       name: "User",
                                       birth_place: "Jakarta",
                                       birth_date: nil,
                                       blood_type: "AB",
                                       bpjs_id: "00127295921",
                                       ktp_id: "00127295921" }
        expect(response).to have_http_status(422)
      end
      it "blood type can't be blank" do
        post '/api/sign_up', params: { email: "user@example.com",
                                       password_digest: "Examples20#",
                                       name: "User",
                                       birth_place: "Jakarta",
                                       birth_date: "2020-10-10",
                                       blood_type: nil,
                                       bpjs_id: "00127295921",
                                       ktp_id: "00127295921" }
        expect(response).to have_http_status(422)
      end
      it "id BPJS can't be blank" do
        post '/api/sign_up', params: { email: "user@example.com",
                                       password_digest: "Examples20#",
                                       name: "User",
                                       birth_place: "Jakarta",
                                       birth_date: "2020-10-10",
                                       blood_type: "A",
                                       bpjs_id: nil,
                                       ktp_id: "00127295921" }
        expect(response).to have_http_status(422)
      end
      it "id KTP can't be blank" do
        post '/api/sign_up', params: { email: "user@example.com",
                                       password_digest: "Examples20#",
                                       name: "User",
                                       birth_place: "Jakarta",
                                       birth_date: "2020-10-10",
                                       blood_type: "A",
                                       bpjs_id: "00127295921",
                                       ktp_id: nil }
        expect(response).to have_http_status(422)
      end
    end

    context "when request is valid status code 201" do
      it "user has been registered" do
        post '/api/sign_up', params: { email: 'user@example.com',
                                       password_digest: 'Examples20#',
                                       name: "User",
                                       birth_place: "Jakarta",
                                       birth_date: "2022-10-15",
                                       blood_type: "AB",
                                       bpjs_id: "00127295921",
                                       ktp_id: "3673033607930003" }
        expect(response.content_type).to eq "application/json; charset=utf-8"
      end

      it "user has been valid" do
        post '/api/sign_up', params: { email: 'user@example.com',
                                       password_digest: 'Examples20#',
                                       name: "User",
                                       birth_place: "Jakarta",
                                       birth_date: "2022-10-15",
                                       blood_type: "AB",
                                       bpjs_id: "00127295921",
                                       ktp_id: "3673033607930003" }
        expect(response).to have_http_status(201)
      end
    end
  end
end
