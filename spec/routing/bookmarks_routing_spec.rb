require "spec_helper"

describe BookmarksController do
  describe "routing" do

    it "routes to #new" do
      get("/cards/1/bookmarks/new").should route_to("bookmarks#new", :card_id => "1")
    end

    it "routes to #show" do
      get("/cards/1/bookmarks/1").should route_to("bookmarks#show", :card_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/cards/1/bookmarks/1/edit").should route_to("bookmarks#edit", :card_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/cards/1/bookmarks").should route_to("bookmarks#create", :card_id => "1")
    end

    it "routes to #update" do
      put("/cards/1/bookmarks/1").should route_to("bookmarks#update", :card_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cards/1/bookmarks/1").should route_to("bookmarks#destroy", :card_id => "1", :id => "1")
    end

  end
end
