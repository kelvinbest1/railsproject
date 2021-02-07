class CreateRestaurants < ActiveRecord::Migration[6.0]
    def change
      create_table :restaurants do |t|
        t.string :restaurant_data
        t.timestamps
      end
    end
  end
  