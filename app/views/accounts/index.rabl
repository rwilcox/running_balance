collection @accounts

extends "accounts/show"

if @include_recent_transactions
  child :recent_transactions do
    extends "transactions/show"
  end
end

