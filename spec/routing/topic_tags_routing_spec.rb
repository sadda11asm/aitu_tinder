require "rails_helper"

RSpec.describe TopicTagsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/topic_tags").to route_to("topic_tags#index")
    end

    it "routes to #show" do
      expect(get: "/topic_tags/1").to route_to("topic_tags#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/topic_tags").to route_to("topic_tags#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/topic_tags/1").to route_to("topic_tags#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/topic_tags/1").to route_to("topic_tags#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/topic_tags/1").to route_to("topic_tags#destroy", id: "1")
    end
  end
end
