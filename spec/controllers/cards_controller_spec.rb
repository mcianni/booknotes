require 'spec_helper'

describe CardsController do

  # This should return the minimal set of attributes required to create a valid
  # Card. As you add validations to Card, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all cards as @cards" do
      card = Card.create! valid_attributes
      get :index, {}, valid_session
      assigns(:cards).should eq([card])
    end
  end

  describe "GET show" do
    it "assigns the requested card as @card" do
      card = Card.create! valid_attributes
      get :show, {:id => card.to_param}, valid_session
      assigns(:card).should eq(card)
    end
  end

  describe "GET new" do
    it "assigns a new card as @card" do
      get :new, {}, valid_session
      assigns(:card).should be_a_new(Card)
    end
  end

  describe "GET edit" do
    it "assigns the requested card as @card" do
      card = Card.create! valid_attributes
      get :edit, {:id => card.to_param}, valid_session
      assigns(:card).should eq(card)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Card" do
        expect {
          post :create, {:card => valid_attributes}, valid_session
        }.to change(Card, :count).by(1)
      end

      it "assigns a newly created card as @card" do
        post :create, {:card => valid_attributes}, valid_session
        assigns(:card).should be_a(Card)
        assigns(:card).should be_persisted
      end

      it "redirects to the created card" do
        post :create, {:card => valid_attributes}, valid_session
        response.should redirect_to(Card.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved card as @card" do
        # Trigger the behavior that occurs when invalid params are submitted
        Card.any_instance.stub(:save).and_return(false)
        post :create, {:card => { "title" => "invalid value" }}, valid_session
        assigns(:card).should be_a_new(Card)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Card.any_instance.stub(:save).and_return(false)
        post :create, {:card => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested card" do
        card = Card.create! valid_attributes
        # Assuming there are no other cards in the database, this
        # specifies that the Card created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Card.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => card.to_param, :card => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested card as @card" do
        card = Card.create! valid_attributes
        put :update, {:id => card.to_param, :card => valid_attributes}, valid_session
        assigns(:card).should eq(card)
      end

      it "redirects to the card" do
        card = Card.create! valid_attributes
        put :update, {:id => card.to_param, :card => valid_attributes}, valid_session
        response.should redirect_to(card)
      end
    end

    describe "with invalid params" do
      it "assigns the card as @card" do
        card = Card.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Card.any_instance.stub(:save).and_return(false)
        put :update, {:id => card.to_param, :card => { "title" => "invalid value" }}, valid_session
        assigns(:card).should eq(card)
      end

      it "re-renders the 'edit' template" do
        card = Card.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Card.any_instance.stub(:save).and_return(false)
        put :update, {:id => card.to_param, :card => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested card" do
      card = Card.create! valid_attributes
      expect {
        delete :destroy, {:id => card.to_param}, valid_session
      }.to change(Card, :count).by(-1)
    end

    it "redirects to the cards list" do
      card = Card.create! valid_attributes
      delete :destroy, {:id => card.to_param}, valid_session
      response.should redirect_to(cards_url)
    end
  end

end
