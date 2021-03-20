require "rails_helper"

RSpec.describe TopicRoomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/topic_rooms").to route_to("topic_rooms#index")
    end

    it "routes to #show" do
      expect(get: "/topic_rooms/1").to route_to("topic_rooms#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/topic_rooms").to route_to("topic_rooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/topic_rooms/1").to route_to("topic_rooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/topic_rooms/1").to route_to("topic_rooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/topic_rooms/1").to route_to("topic_rooms#destroy", id: "1")
    end
  end
end
