# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.float :total
      t.date :orderDate
      t.references :customers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
