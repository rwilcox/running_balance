#-*- tab-width: 2; indent-tabs-mode: nil; x-auto-expand-tabs: true; x-counterpart: ../../app/controllers/accounts_controller.rb; x-typographers-quotes: false; -*-

require 'spec_helper'

describe AccountsController do

  # This should return the minimal set of attributes required to create a valid
  # Account. As you add validations to Account, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:user_id => @current_user.id, :starting_balance => 42, :name => "Test Account"}
  end

  before(:each) do
    @current_user = User.make!
    @account = Account.make!(:user => @current_user)

    sign_in @current_user
  end
  
  describe "GET index" do
    it "assigns all the user's accounts as @accounts" do
      get :index
      assigns(:accounts).should eq([@account])
    end

    it "only assigns the current user's accounts as @accounts" do
      another_account = Account.make!(user: User.make!)
      get :index
      assigns(:accounts).should eq( [@account] )
    end
  end

  describe "GET show" do
    it "assigns the requested account as @account" do
      get :show, :id => @account.id.to_s
      assigns(:account).should eq(@account)
    end

    it "gives an authorization error when the user is not authorized for an account" do
      pending
=begin      
      another_account = Account.make!(user: User.make!)
      get :show, :id => another_account.id

      response.should
=end
    end
  end

  describe "GET new" do
    it "assigns a new account as @account" do
      get :new
      assigns(:account).should be_a_new(Account)
    end
  end

  describe "GET edit" do
    it "assigns the requested account as @account" do
      get :edit, :id => @account.id.to_s
      assigns(:account).should eq(@account)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Account" do
        expect {
          post :create, :account => valid_attributes
        }.to change(Account, :count).by(1)
      end

      it "redirects to the created account" do
        post :create, :account => valid_attributes
        response.should redirect_to(Account.last)
      end

      it "associates the account with the current user, automatically" do
        expect {
          post :create, :account => {starting_balance: 42, name: "Test Account"}
        }.to change(@current_user.accounts, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved account as @account" do
        # Trigger the behavior that occurs when invalid params are submitted
        Account.any_instance.stub(:save).and_return(false)
        post :create, :account => {}
        assigns(:account).should be_a_new(Account)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Account.any_instance.stub(:save).and_return(false)
        post :create, :account => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested account" do
        account = Account.make!(user: @current_user)
        # Assuming there are no other accounts in the database, this
        # specifies that the Account created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Account.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => account.id, :account => {'these' => 'params'}
      end

      it "assigns the requested account as @account" do
        put :update, :id => @account.id, :account => valid_attributes
        assigns(:account).should eq(@account)
      end

      it "redirects to the account" do
        put :update, :id => @account.id, :account => valid_attributes
        response.should redirect_to(@account)
      end

      it "gives an authorization error when the account does not belong to the current user" do
        pending
      end
    end

    describe "with invalid params" do
      it "assigns the account as @account" do
        # Trigger the behavior that occurs when invalid params are submitted
        Account.any_instance.stub(:save).and_return(false)
        put :update, :id => @account.id.to_s, :account => {}
        assigns(:account).should eq(@account)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Account.any_instance.stub(:save).and_return(false)
        put :update, :id => @account.id.to_s, :account => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested account" do
      expect {
        delete :destroy, :id => @account.id.to_s
      }.to change(Account, :count).by(-1)
    end

    it "redirects to the accounts list" do
      delete :destroy, :id => @account.id.to_s
      response.should redirect_to(accounts_url)
    end

    it "gives an authorization error when the account does not belong to the current user" do
      pending
    end
  end

end
