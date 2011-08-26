object @transaction

code :uri do |t|
  account_transaction_url(t.account, t)
end

attribute :id
attribute :description
attribute :amount
attribute :active_on
attribute :created_at
