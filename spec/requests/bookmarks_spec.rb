require 'spec_helper'

describe "Bookmarks" do
  before(:each) do
    @card = Card.new(title: "Test Card")
    @card.save!
  end

  describe "GET /cards/1/bookmarks" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get card_bookmarks_path(@card.id)
      response.status.should be(200)
    end
  end
end
