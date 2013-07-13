require 'spec_helper'

describe "bookmarks/edit" do
  before(:each) do
    @bookmark = assign(:bookmark, stub_model(Bookmark,
      :title => "MyString",
      :url => "MyString",
      :card => nil
    ))
  end

  before(:each) do 
    @card = assign(:card, stub_model(Card,
       :title => 'Test Card'
    )) 
  end
  
  it "renders the edit bookmark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", card_bookmark_path(@card, @bookmark), "post" do
      assert_select "input#bookmark_title[name=?]", "bookmark[title]"
      assert_select "input#bookmark_url[name=?]", "bookmark[url]"
    end
  end
end
