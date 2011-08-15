User.blueprint do
  email { "user#{sn}@example.com" }
  password { "*" * 6 }
end