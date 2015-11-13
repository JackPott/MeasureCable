class CreateDrumTypes < ActiveRecord::Migration
  def change
    create_table :drum_types do |t|
      t.integer :diameter
      t.integer :width
      t.string :description
      t.integer :empty_grams

      t.timestamps null: false
    end
  end
end
