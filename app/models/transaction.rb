class Transaction < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
  belongs_to :account

  monetize :amount

  validates :amount, numericality: {greater_than: 0.00}, presence: true
  validates :user, :account, :category, presence: true
  after_save :update_account
  private
  def update_account
    self.account.balance += self.amount
    self.account.save!
  end
end
