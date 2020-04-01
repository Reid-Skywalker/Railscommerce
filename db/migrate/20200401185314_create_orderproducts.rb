class CreateOrderproducts < ActiveRecord::Migration[6.0]
  def change
    create_table :orderproducts do |t|

      t.timestamps
    end
  end
end
