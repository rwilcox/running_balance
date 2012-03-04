class Transaction < ActiveRecord::Base
  belongs_to :account

  validates_presence_of :description
  validates_presence_of :amount
  validates_numericality_of :amount

  delegate :user, :to => :account
  delegate :name, :to => :account, :prefix => :account

  before_save :default_active_on

  # return the transactions that are active. For example, you might not want to mark
  # your rent payment as active until the 26th, even though you put it in the database.
  def self.active
    where( ["active_on <= ?", Date.today] )
  end

  def self.sort_by_date
    order("active_on DESC")
  end


  def self.limit_for_month(filter_or_not)
    if filter_or_not
      where( ["active_on >= ?", DateUtils.start_of_previous_month])
    else
      where(["1 = 1"])
    end
  end


  def default_active_on
    self.active_on = Date.today unless active_on
  end

end
