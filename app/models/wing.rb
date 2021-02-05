class Wing < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    validates :type, :flavor, presence: true

    default_scope { order(:type) }

end
