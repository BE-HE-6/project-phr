require 'rails_helper'

RSpec.describe "BloodGlucoses", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/blood_glucoses/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/blood_glucoses/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/blood_glucoses/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/blood_glucoses/index"
      expect(response).to have_http_status(:success)
    end
  end

end
