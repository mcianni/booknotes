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
    @card = Card.new({ title: 'Test Card' })
    @card.save!
  end
  
  it "renders the edit bookmark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", card_bookmark_path(@card, @bookmark), "post" do
      assert_select "input#bookmark_title[name=?]", "bookmark[title]"
      assert_select "input#bookmark_url[name=?]", "bookmark[url]"
      assert_select "input#bookmark_card[name=?]", "bookmark[card]"
    end
  end
end
