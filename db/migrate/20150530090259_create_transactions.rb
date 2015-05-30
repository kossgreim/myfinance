class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 30, scale: 10
      t.string :comment
      t.references :category, index: true, foreign_key: true
      t.references :subcategory, index: true
      t.references :user, index: true, foreign_key: true
      t.references :account, index: true, foreign_key: true
      t.boolean :type, default: false
      t.timestamps null: false
    end
  end
end
