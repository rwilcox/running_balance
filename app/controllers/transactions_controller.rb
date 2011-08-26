class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :current_account

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = current_account.transactions.sort_by_date
    @filename = "transactions.csv"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
      format.csv
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = current_account.transactions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = current_account.transactions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = current_account.transactions.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = current_account.transactions.new(params[:transaction])

    respond_to do |format|
      if @transaction.save
        format.html { 
            redirect_to_target_or_default(
                account_transaction_path(current_account, @transaction),
                notice: 'Transaction was successfully created.' )
        }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = current_account.transactions.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { 
            redirect_to_target_or_default(
                account_transaction_url(current_account, @transaction),
                notice: 'Transaction was successfully updated.'
            )
        }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = current_account.transactions.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to account_transactions_url(current_account) }
      format.json { head :ok }
    end
  end


protected

  def current_account
    @account ||= current_user.accounts.find(params[:account_id])
  end
end
