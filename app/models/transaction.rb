class Transaction < ActiveRecord::Base
  belongs_to :account

  delegate :user, :to => :account
  delegate :name, :to => :account, :prefix => :true
end
