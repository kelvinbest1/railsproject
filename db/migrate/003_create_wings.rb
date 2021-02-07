class CreateWings < ActiveRecord::Migration[6.0]
    def change
      create_table :wings do |t|
        t.string :style
        t.string :flavor
        t.integer :user_id
        t.integer :restaurant_id
        t.timestamps
      end
    end
  end
  