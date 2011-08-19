class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions

  validates_numericality_of :starting_balance

  def current_balance
    # TODO: implement me!
  end
end
