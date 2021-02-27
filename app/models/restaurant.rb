class Restaurant < ApplicationRecord
    has_many :wings
    has_many :users, through: :wings

    validates :restaurant_data, presence: true
    validates :restaurant_data, uniqueness: true


    def self.restaurant_with_most_visits
        self.joins(:wings).group('wings.id').order('count(wings.id) desc')

    end
end
