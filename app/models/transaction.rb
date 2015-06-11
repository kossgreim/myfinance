class Transaction < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
  belongs_to :account

  monetize :amount

  validates :amount, numericality: {greater_than: 0.00}, presence: true
  validates :user, :account, :category, presence: true

  def perform_transaction
    ActiveRecord::Base.transaction do 
      self.save!
      # check if positive, than add to balance otherwise minus
      if self.type? 
        self.account.update! balance: (self.account.balance + self.amount )
      else
        self.account.update! balance: (self.account.balance - self.amount )
      end
      true
    end
  end
end
