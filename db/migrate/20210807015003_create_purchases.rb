class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :item, foreign_key: true
      t.references :merchant, foreign_key: true
      t.string :purchaser_name
      t.integer :purchase_count
      t.float :total_purchase

      t.timestamps
    end
  end
end
