class Restaurant < ApplicationRecord
    has_many :wings
    has_many :users, through: :wings
    has_many :user_restaurants
   

    validates :restaurant_data, presence: true
    validates :restaurant_data, uniqueness: true


end
