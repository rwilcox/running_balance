collection @accounts

attributes :name, :id, :starting_balance, :current_balance

code :path do |a|
  account_url(a)
end

if @include_recent_transactions
  child :recent_transactions do
    extends "transactions/show"
  end
end

