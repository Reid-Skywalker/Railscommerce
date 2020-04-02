# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :cost
      t.integer :stock
      t.references :catagories, null: true, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
