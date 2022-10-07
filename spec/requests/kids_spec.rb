require 'rails_helper'

RSpec.describe "Kids", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/kids/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/kids/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/kids/show"
      expect(response).to have_http_status(:success)
    end
  end

end
