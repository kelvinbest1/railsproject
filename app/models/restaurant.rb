class Restaurant < ApplicationRecord
    has_many :wings
    has_many :users, through: :wings

    validates :restaurant_data, presence: true
    validates :restaurant_data, uniqueness: true


    def self.restuarant_with_most_wings
        self.joins(:wings).group('wings.id').order('count(wings.id) desc limit 1')
    end
end