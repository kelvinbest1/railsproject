class User < ApplicationRecord

    has_many :wings
    has_many :restaurants, through: :wings
    has_secure_password

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true

    accepts_nested_attributes_for :wings