require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  let(:user) { FactoryBot.create(:user, email: 'user@examples.com', password: 'Examples20#') }
  describe "POST api/sign_in" do
    context "when request is invalid login" do
      it "email can't be blank status code 422" do
        post '/api/sign_in', params: {
          email: nil,
          password: "Examples20#"
        }
        expect(response).to have_http_status(422)
      end
      it "password can't be blank status code 422" do
        post '/api/sign_in', params: {
          email: "user@examples.com",
          password: nil
        }
        expect(response).to have_http_status(422)
      end
    end

    context "when request is valid login" do
      it "user has been successfully logged in" do
        post '/api/sign_in', params: {
            email: user.email,
            password: "Examples20#"
          }
        expect(response.content_type).to eq "application/json; charset=utf-8"
      end

      it "user has been valid status code 200" do
        post '/api/sign_in', params: {
          email: user.email,
          password: "Examples20#",
        }
        expect(response).to have_http_status(200)
      end
    end
  end
end
