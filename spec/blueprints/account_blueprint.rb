Account.blueprint do
  name { "My First Account" }
  starting_balance { 42 }
  user { User.make }
end