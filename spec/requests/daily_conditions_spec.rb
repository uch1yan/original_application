require 'rails_helper'

RSpec.describe "DailyConditions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/daily_conditions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/daily_conditions/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/daily_conditions/show"
      expect(response).to have_http_status(:success)
    end
  end

end
