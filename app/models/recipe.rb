class Recipe < ApplicationRecord
    validates :name, presence: true

    has_many :recipe_foods
    belongs_to :user
end

