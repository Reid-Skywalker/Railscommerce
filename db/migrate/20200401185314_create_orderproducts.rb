class CreateOrderproducts < ActiveRecord::Migration[6.0]
  def change
    create_table :orderproducts do |t|

      t.references :products, null: false, foreign_key: true
      t.references :orders, null: false, foreign_key: true
      t.timestamps
    end
  end
end
