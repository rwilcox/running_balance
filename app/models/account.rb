class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions

  validates_presence_of :name
  validates_presence_of :starting_balance
  validates_numericality_of :starting_balance


  # What is the current balance of the account?
  def current_balance
    starting_balance + transactions.sum(:amount)
  end


  # What is the current balance today, excluding transactions that will happen in the future?
  def current_balance_active_only
    starting_balance + transactions.active.sum(:amount)
  end


  def recent_transactions(*args)
    options = args.extract_options!

    transactions.active.order("active_on DESC").limit( options[:limit] )
  end
end
