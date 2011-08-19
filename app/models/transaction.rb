class Transaction < ActiveRecord::Base
  belongs_to :account

  delegate :user, :to => :account
end
