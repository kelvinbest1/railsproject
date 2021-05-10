class Wing < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :restaurant

    validates :style, :flavor, presence: true

    default_scope { order(:style) }

end
