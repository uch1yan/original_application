require 'rails_helper'

RSpec.describe "Checks", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/checks/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/checks/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
