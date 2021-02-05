class Restaurant < ApplicationRecord
    has_many :wings
    has_many :users, through: :wings

    validates :restaurant_type, presence: true
    validates :restaurant_type, uniqueness: true