class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.int :quantity
      t.float :total
      t.date :orderDate

      t.timestamps
    end
  end
end
