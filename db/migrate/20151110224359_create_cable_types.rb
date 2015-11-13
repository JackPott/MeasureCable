class CreateCableTypes < ActiveRecord::Migration
  def change
    create_table :cable_types do |t|
      t.string :sku
      t.string :description
      t.integer :grams_per_metre

      t.timestamps null: false
    end
  end
end
