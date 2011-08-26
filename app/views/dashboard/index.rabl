object current_user

attributes :email

child :accounts do
  extends "accounts/index"
end
