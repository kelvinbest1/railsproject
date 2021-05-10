class Restaurant < ApplicationRecord
    has_many :wings
    has_many :users, through: :wings
   
   

    validates :name, presence: true
    validates :name, uniqueness: true


end
