require 'rails_helper'

RSpec.describe "BloodOxygens", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/blood_oxygens/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/blood_oxygens/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/blood_oxygens/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/blood_oxygens/index"
      expect(response).to have_http_status(:success)
    end
  end

end
