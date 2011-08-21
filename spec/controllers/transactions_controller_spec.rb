require 'spec_helper'

describe TransactionsController do


  # This should return the minimal set of attributes required to create a valid
  # Transaction. As you add validations to Transaction, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:account_id => @account.id}
  end

  describe "as an unauthorized user, it redirects me to the signup page" do
    before(:each) do
      @account = Account.make!(name: "hello world")
    end

    it "when I try to access the transactions index" do
      get :index, {account_id: @account.id}
      response.should redirect_to( new_user_session_path )
    end
  
    it "when I try to access a created transaction" do
      transaction = Transaction.create! valid_attributes
      get :show, :id => transaction.id.to_s, :account_id => @account.id
      response.should redirect_to( new_user_session_path )
    end

    it "when I try to edit a transaction" do
      transaction = Transaction.create! valid_attributes
      get :edit, :id => transaction.id.to_s, :account_id => @account.id
      response.should redirect_to( new_user_session_path )
    end

    it "when I try to create a new transaction" do
      post :create, {transaction: valid_attributes, account_id: @account.id}
      response.should redirect_to( new_user_session_path )
    end

    it "when I try to PUT an update of a transaction" do
      transaction = Transaction.create! valid_attributes
      Transaction.any_instance.should_receive(:update_attributes).never.with({'these' => 'params'})
      put :update, :id => transaction.id, :transaction => {'these' => 'params'}, :account_id => @account.id
      response.should redirect_to( new_user_session_path )
    end

    it "when I try to delete a transaction" do
      transaction = Transaction.create! valid_attributes
      expect {
        delete :destroy, :id => transaction.id.to_s, :account_id => @account.id
      }.to_not change(Transaction, :count)
      
      response.should redirect_to( new_user_session_path )
    end
  end

  describe "as an authorized user, but not the owner of the account, it allow me to" do
    before(:each) do
      @current_user = User.make!
      @account = Account.make!(name: "hello world")

      sign_in @current_user
    end

    it "not access the the transactions index" do
      expect {
        get :index, {account_id: @account.id}
      }.to raise_error(ActiveRecord::RecordNotFound)      
    end

    it "not access a transaction" do
      transaction = Transaction.make!(account: @account)
      expect {
        get :show, :id => transaction.id.to_s, :account_id => @account.id
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "not edit a transaction" do
      transaction = Transaction.make!(account: @account)
      expect {
        get :edit, :id => transaction.id.to_s, :account_id => @account.id
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "not create a transaction" do
      expect {
        post :create, {transaction: valid_attributes, account_id: @account.id}
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "not update a transaction" do
      transaction = Transaction.make!(account: @account)
      expect {
        put :update, :id => transaction.id, :transaction => {'these' => 'params'}, :account_id => @account.id
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "delete a transaction" do
      transaction = Transaction.make!(account: @account)
      expect {
        delete :destroy, :id => transaction.id.to_s, :account_id => @account.id
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end


  describe "as an authorized user, and owner of the specified account, trying to access transactions on the account" do
    before(:each) do
      @current_user = User.make!
      @account = Account.make!(name: "hello world", :user => @current_user)

      sign_in @current_user
    end
    
    describe "GET index" do
      it "assigns all transactions as @transactions" do
        transaction = Transaction.create! valid_attributes
        get :index, {account_id: @account.id}
        assigns(:transactions).should eq([transaction])
      end
    end
  
    describe "GET show" do
      it "assigns the requested transaction as @transaction" do
        transaction = Transaction.create! valid_attributes
        get :show, :id => transaction.id.to_s, :account_id => @account.id
        assigns(:transaction).should eq(transaction)
      end
    end
  
    describe "GET new" do
      it "assigns a new transaction as @transaction" do
        get :new, {account_id:  @account.id}
        assigns(:transaction).should be_a_new(Transaction)
      end
    end
  
    describe "GET edit" do
      it "assigns the requested transaction as @transaction" do
        transaction = Transaction.create! valid_attributes
        get :edit, {id: transaction.id.to_s, account_id: @account.id}
        assigns(:transaction).should eq(transaction)
      end
    end
  
    describe "POST create" do
      describe "with valid params" do
        it "creates a new Transaction" do
          expect {
            post :create, {transaction: valid_attributes, account_id: @account.id}
          }.to change(Transaction, :count).by(1)
        end
  
        it "assigns a newly created transaction as @transaction" do
          post :create, {transaction: valid_attributes, account_id: @account.id}
          assigns(:transaction).should be_a(Transaction)
          assigns(:transaction).should be_persisted
        end
  
        it "redirects to the created transaction" do
          post :create, {transaction: valid_attributes, account_id: @account}
          response.should redirect_to( account_transaction_path(@account, Transaction.last) )
        end
      end
  
      describe "with invalid params" do
        it "assigns a newly created but unsaved transaction as @transaction" do
          # Trigger the behavior that occurs when invalid params are submitted
          Transaction.any_instance.stub(:save).and_return(false)
          post :create, {transaction: {}, account_id: @account.id}
          assigns(:transaction).should be_a_new(Transaction)
        end
  
        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Transaction.any_instance.stub(:save).and_return(false)
          post :create, {transaction: {}, account_id: @account.id}
          response.should render_template("new")
        end
      end
    end
  
    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested transaction" do
          transaction = Transaction.create! valid_attributes
          Transaction.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => transaction.id, :transaction => {'these' => 'params'}, :account_id => @account.id
        end
  
        it "assigns the requested transaction as @transaction" do
          transaction = Transaction.create! valid_attributes
          put :update, :id => transaction.id, :transaction => valid_attributes, :account_id => @account.id
          assigns(:transaction).should eq(transaction)
        end
  
        it "redirects to the transaction" do
          transaction = Transaction.create! valid_attributes
          put :update, :id => transaction.id, :transaction => valid_attributes, :account_id => @account.id
          response.should redirect_to( account_transaction_path(@account, transaction) )
        end
      end
  
      describe "with invalid params" do
        it "assigns the transaction as @transaction" do
          transaction = Transaction.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Transaction.any_instance.stub(:save).and_return(false)
          put :update, :id => transaction.id.to_s, :transaction => {}, :account_id => @account.id
          assigns(:transaction).should eq(transaction)
        end
  
        it "re-renders the 'edit' template" do
          transaction = Transaction.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Transaction.any_instance.stub(:save).and_return(false)
          put :update, :id => transaction.id.to_s, :transaction => {}, :account_id => @account.id
          response.should render_template("edit")
        end
      end
    end
  
    describe "DELETE destroy" do
      it "destroys the requested transaction" do
        transaction = Transaction.create! valid_attributes
        expect {
          delete :destroy, :id => transaction.id.to_s, :account_id => @account.id
        }.to change(Transaction, :count).by(-1)
      end
  
      it "redirects to the transactions list" do
        transaction = Transaction.create! valid_attributes
        delete :destroy, :id => transaction.id.to_s, :account_id => @account.id
        response.should redirect_to( account_transactions_url(@account) )
      end
    end
  end
end
