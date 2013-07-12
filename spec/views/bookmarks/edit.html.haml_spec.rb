require 'spec_helper'

describe "bookmarks/edit" do
  before(:each) do
    @bookmark = assign(:bookmark, stub_model(Bookmark,
      :title => "MyString",
      :url => "MyString",
      :card => nil
    ))
  end

  it "renders the edit bookmark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bookmark_path(@bookmark), "post" do
      assert_select "input#bookmark_title[name=?]", "bookmark[title]"
      assert_select "input#bookmark_url[name=?]", "bookmark[url]"
      assert_select "input#bookmark_card[name=?]", "bookmark[card]"
    end
  end
end
