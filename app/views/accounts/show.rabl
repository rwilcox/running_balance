object @account

attribute :id
attribute :name
attribute :starting_balance
attribute :current_balance
attribute :current_balance_active_only
attribute :created_at
attribute :updated_at

code :uri do |t|
  account_url(t)
end
