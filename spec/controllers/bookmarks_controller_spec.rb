require 'spec_helper'

describe BookmarksController do

  before(:each) do
    @card = Card.new(title: "Test Card")
    @card.save!
  end
 
  # This should return the minimal set of attributes required to create a valid
  # Bookmark. As you add validations to Bookmark, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { 
    "title" => "MyString",
    "url"   => "http://google.com",
    "card_id" => @card.id
  
  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BookmarksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

 
  describe "GET show" do
    it "assigns the requested bookmark as @bookmark" do
      bookmark = Bookmark.create! valid_attributes
      get :show, { :card_id => @card.id, :id => bookmark.to_param}, valid_session
      assigns(:bookmark).should eq(bookmark)
    end
  end

  describe "GET new" do
    it "assigns a new bookmark as @bookmark" do
      get :new, { :card_id => @card.id }, valid_session
      assigns(:bookmark).should be_a_new(Bookmark)
    end
  end

  describe "GET edit" do
    it "assigns the requested bookmark as @bookmark" do
      bookmark = Bookmark.create! valid_attributes
      get :edit, { :card_id => @card.id, :id => bookmark.to_param}, valid_session
      assigns(:bookmark).should eq(bookmark)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Bookmark" do
        expect {
          post :create, { :card_id => @card.id, :bookmark => valid_attributes}, valid_session
        }.to change(Bookmark, :count).by(1)
      end

      it "assigns a newly created bookmark as @bookmark" do
        post :create, { :card_id => @card.id, :bookmark => valid_attributes}, valid_session
        assigns(:bookmark).should be_a(Bookmark)
        assigns(:bookmark).should be_persisted
      end

      it "redirects to the created bookmark" do
        post :create, { :card_id => @card.id, :bookmark => valid_attributes}, valid_session
        response.should redirect_to([@card, Bookmark.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bookmark as @bookmark" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bookmark.any_instance.stub(:save).and_return(false)
        post :create, { :card_id => @card.id, :bookmark => { "title" => "invalid value" }}, valid_session
        assigns(:bookmark).should be_a_new(Bookmark)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bookmark.any_instance.stub(:save).and_return(false)
        post :create, { :card_id => @card.id, :bookmark => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bookmark" do
        bookmark = Bookmark.create! valid_attributes
        # Assuming there are no other bookmarks in the database, this
        # specifies that the Bookmark created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Bookmark.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, { :card_id => @card.id, :id => bookmark.to_param, :bookmark => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested bookmark as @bookmark" do
        bookmark = Bookmark.create! valid_attributes
        put :update, { :card_id => @card.id, :id => bookmark.to_param, :bookmark => valid_attributes}, valid_session
        assigns(:bookmark).should eq(bookmark)
      end

      it "redirects to the bookmark" do
        bookmark = Bookmark.create! valid_attributes
        put :update, { :card_id => @card.id, :id => bookmark.to_param, :bookmark => valid_attributes}, valid_session
        response.should redirect_to([@card, bookmark])
      end
    end

    describe "with invalid params" do
      it "assigns the bookmark as @bookmark" do
        bookmark = Bookmark.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bookmark.any_instance.stub(:save).and_return(false)
        put :update, { :card_id => @card.id, :id => bookmark.to_param, :bookmark => { "title" => "invalid value" }}, valid_session
        assigns(:bookmark).should eq(bookmark)
      end

      it "re-renders the 'edit' template" do
        bookmark = Bookmark.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bookmark.any_instance.stub(:save).and_return(false)
        put :update, { :card_id => @card.id, :id => bookmark.to_param, :bookmark => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bookmark" do
      bookmark = Bookmark.create! valid_attributes
      expect {
        delete :destroy, { :card_id => @card.id, :id => bookmark.to_param}, valid_session
      }.to change(Bookmark, :count).by(-1)
    end

    it "redirects to the bookmarks list" do
      bookmark = Bookmark.create! valid_attributes
      delete :destroy, { :card_id => @card.id, :id => bookmark.to_param}, valid_session
      response.should redirect_to(card_bookmarks_url(@card))
    end
  end

end
