require 'rails_helper'

RSpec.describe "Api::Registrations", type: :request do
  let(:user) {
    FactoryBot.create(
      :user,
      email: "user@examples.com",
      password: "Examples20#",
      name: "User",
      birth_place: "Jakarta",
      birth_date: "2022-10-10",
      blood_type: "B",
      bpjs_id: "00127295921",
      ktp_id: "3673033607930003")
  }
  describe "POST /api/sign_up" do
    context "when request is invalid sign up" do
      it "email can't be blank status code 422" do
        post '/api/sign_up', params: {
          user: {
            email: nil
          }
        }
        expect(response).to have_http_status(422)
      end
      it "password can't be blank status code 422" do
        post '/api/sign_up', params: {
          user: {
            password: nil
          }
        }
        expect(response).to have_http_status(422)
      end
      it "name can't be blank status code 422" do
        post '/api/sign_up', params: {
          user: {
            name: nil,
          }
        }
        expect(response).to have_http_status(422)
      end
      it "birth place can't be blank status code 422" do
        post '/api/sign_up', params: {
          user: {
            birth_place: nil
          }
        }
        expect(response).to have_http_status(422)
      end
      it "birth date can't be blank status code 422" do
        post '/api/sign_up', params: {
          user: {
            birth_date: nil
          }
        }
        expect(response).to have_http_status(422)
      end
      it "blood type can't be blank status code 422" do
        post '/api/sign_up', params: {
          user: {
            blood_type: nil
          }
        }
        expect(response).to have_http_status(422)
      end
      it "id BPJS can't be blank status code 422" do
        post '/api/sign_up', params: {
          user: {
            bpjs_id: nil
          }
        }
        expect(response).to have_http_status(422)
      end
      it "id KTP can't be blank status code 422" do
        post '/api/sign_up', params: {
          user: {
            ktp_id: nil
          }
        }
        expect(response).to have_http_status(422)
      end
    end

    context "when request is valid registration" do
      it "user has been registered" do
        post '/api/sign_up', params: {
          user: {
            email: user.email,
            password: user.password,
            name: user.name,
            birth_place: user.birth_place,
            birth_date: user.birth_date,
            blood_type: user.blood_type,
            bpjs_id: user.bpjs_id,
            ktp_id: user.ktp_id
            }
        }
        expect(response.content_type).to eq "application/json; charset=utf-8"
      end

      it "user has been valid status code 201" do
        post '/api/sign_up', params: {
          user: {
            email: "admin@examples.com",
            password: user.password,
            name: user.name,
            birth_place: user.birth_place,
            birth_date: user.birth_date,
            blood_type: user.blood_type,
            bpjs_id: user.bpjs_id,
            ktp_id: user.ktp_id
          }
        }
        expect(response).to have_http_status(201)
      end
    end
  end
end
