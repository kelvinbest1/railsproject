class User < ApplicationRecord

    has_many :wings
    has_many :restaurants, through: :wings
    has_secure_password

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true

    accepts_nested_attributes_for :wings

    default_scope { order(:name) }

    #scope method for session login omniauth
    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:name => auth_hash['info']['name'], :email => auth_hash['info']['email']).first_or_create do |user|
            user.password = SecureRandom.hex(16)
        end
    end

    def self.user_search(u_search)
        self.where("name LIKE ?", "%" + u_search + "%")
    end

end