Transaction.blueprint do
  account { Account.make }
  amount  { 42 }
  description {"A test transaction"}
end
