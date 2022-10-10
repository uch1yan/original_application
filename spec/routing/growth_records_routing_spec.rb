require "rails_helper"

RSpec.describe GrowthRecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/growth_records").to route_to("growth_records#index")
    end

    it "routes to #new" do
      expect(get: "/growth_records/new").to route_to("growth_records#new")
    end

    it "routes to #show" do
      expect(get: "/growth_records/1").to route_to("growth_records#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/growth_records/1/edit").to route_to("growth_records#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/growth_records").to route_to("growth_records#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/growth_records/1").to route_to("growth_records#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/growth_records/1").to route_to("growth_records#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/growth_records/1").to route_to("growth_records#destroy", id: "1")
    end
  end
end
