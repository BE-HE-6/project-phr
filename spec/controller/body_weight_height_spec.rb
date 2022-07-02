require 'rails_helper'

RSpec.describe "BodyWeightHeightController", type: :request do
  let(:body_weight_height) { create(:body_weight_height) } 

  describe "GET /api/body_weight_height" do
    context "with valid data" do
      before do
        get body_weight_height_index_path
      end
      it "return HTTP success" do
        expect(response).to have_http_status(:success)
      end 
      it "JSON body response contains expected BodyWeightHeight attributes" do
        json_response = JSON.parse(response.body)
        json_response["status"] == :success
      end
    end
    
  end

  describe "GET /api/body_weight_height/:id" do
      context "with a valid ID" do
        before do
          get body_weight_height_path(id: body_weight_height.id)
        end
        it "return HTTP success" do
          expect(response).to have_http_status(200)
        end
        it "JSON body response contains expected BodyWeightHeight attributes" do
          json_response = JSON.parse(response.body)
          json_response["status"] == :success
        end
      end

      context "with an invalid ID" do
        it "return error" do
          expect { 
            get body_weight_height_path(id: "invalid-identifier")
          }.to raise_error ActiveRecord::RecordNotFound
        end
      end
      
  end

  describe 'POST /api/body_weight_height' do
    context "the request is valid" do
      it "created a BodyWeightHeight data" do
        post "/api/body_weight_height", params: {
          user_id: 1,
          weight: 80.5,
          height: 157.5,
          note: "Thats note",
          bmi_calculation: 24.4,
          date_time: "29-10-2022 14:55:55"
      }
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe "DELETE /api/body_weight_height" do
    context "is valid record" do
      it "delete BodyweighHeight data" do
        delete body_weight_height_path(id: body_weight_height.id)
        expect(response).to have_http_status(:no_content)
      end
    end
  end
















end
