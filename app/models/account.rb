class Account < ActiveRecord::Base
  belongs_to :user

  validates_numericality_of :starting_balance
end
