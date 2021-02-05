class CreateWings < ActiveRecord::Migration[6.0]
    def change
      create_table :wings do |t|
        t.string :type
        t.string :flavor
        t.integer :user_id
        t.integer :location_id
        t.timestamps
      end
    end
  end
  