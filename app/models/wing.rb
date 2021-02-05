class Wing < ApplicationRecord
    belongs_to :user
    belongs_to :location

    validates :type, :flavor, presence: true

    default_scope { order(:type) }

end
