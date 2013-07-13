require 'spec_helper'

describe "bookmarks/show" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :title => "Test Card"
    ))
    
    @bookmark = assign(:bookmark, stub_model(Bookmark,
      :title => "Title",
      :url => "Url",
      :card => @card
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Url/)
    rendered.should match(//)
  end
end
