#-*- tab-width: 2; indent-tabs-mode: nil; x-auto-expand-tabs: true; x-counterpart: ../../spec/controllers/accounts_controller_spec.rb; x-typographers-quotes: false; -*-

class AccountsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :account

  respond_to :html, :json

  def index
    @accounts = current_user.accounts
    respond_with @accounts
  end

  def show
    @account = current_user.accounts.find(params[:id])
    respond_with @account
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

  def account
    @account ||= current_user.accounts.find(params[:id])
  end

  def accounts
    @accounts ||= current_user.accounts
  end
end
