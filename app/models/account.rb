class Account < ActiveRecord::Base
  belongs_to :user
  validates :user, :name, presence: true

  def perform_transaction(amount, category, type=false, subcategory=nil, comment=nil)
  	type ? self.balance += amount : self.balance -= amount
  	return false unless self.save
  	transaction = Transaction.new(amount: amount, type: type, category: category, subcategory: subcategory, comment: comment)
  	return false unless transaction.save
  end
end
