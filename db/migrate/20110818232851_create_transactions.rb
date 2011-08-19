class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.float :amount
      t.string :description

      t.timestamps
    end
  end
end
