require 'rails_helper'

RSpec.describe "Families", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/families/new"
      expect(response).to have_http_status(:success)
    end
  end

end
