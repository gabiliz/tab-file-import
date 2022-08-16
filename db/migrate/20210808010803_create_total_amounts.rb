class CreateTotalAmounts < ActiveRecord::Migration[6.1]
  def change
    create_table :total_amounts do |t|

      t.float :last_total_amount
      t.float :all_total_amount

      t.timestamps
    end
  end
end
