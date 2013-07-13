require 'spec_helper'

describe "bookmarks/new" do
  before(:each) do
    assign(:bookmark, stub_model(Bookmark,
      :title => "MyString",
      :url => "MyString",
      :card => nil
    ).as_new_record)
  end

  before(:each) do
    @card =  Card.new({ title: 'Test Card' })
    @card.save!
  end

  it "renders new bookmark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", card_bookmarks_path(@card), "post" do
      assert_select "input#bookmark_title[name=?]", "bookmark[title]"
      assert_select "input#bookmark_url[name=?]", "bookmark[url]"
    end
  end
end
