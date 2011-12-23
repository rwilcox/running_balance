#-*- tab-width: 2; indent-tabs-mode: nil; x-auto-expand-tabs: true; x-counterpart: ../../spec/controllers/accounts_controller_spec.rb; x-typographers-quotes: false; -*-

class AccountsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :current_account, :current_transaction

  respond_to :html, :json, :xml, :csv

  def index
    @accounts = current_user.accounts
    @filename = "accounts.csv"
  end

  def show
    @account = current_user.accounts.find(params[:id])
    #respond_with @account
    respond_to do |format|
      format.html { render "show", :layout => appropriate_layout(:just_content => true) }
      format.json
      format.csv
    end
  end

  def new
    @account = Account.new
    respond_with @account
  end

  def edit
    @account = current_user.accounts.find(params[:id])
    respond_with @account
  end

  def create
    @account = current_user.accounts.create( params[:account] )
    @account.save
    respond_with @account
  end

  def update
    @account = current_user.accounts.find(params[:id])
    @account.update_attributes(params[:account])
    respond_with @account
  end

  def destroy
    @account = current_user.accounts.find(params[:id])
    @account.destroy
    respond_with @account
  end


protected

  def current_account
    @account ||= current_user.accounts.find(params[:id])
  end

  def accounts
    @accounts ||= current_user.accounts
  end

  def current_transaction
    @transaction ||= current_account.transactions.new
  end
end
