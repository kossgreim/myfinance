class MonetizeTransactionAmount < ActiveRecord::Migration
  def change
  	add_money :transactions, :amount
  end
end
