class Recipe < ApplicationRecord
  has_many :steps, -> { order(order: :asc) }, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  validates :title, :description, :time_in_minutes, :portions, :complexity_rating, presence: true
  validates :complexity_rating, inclusion: { in: 1..5 }

  # Scopes
  scope :rescue_recipes, -> { where("metadata->>'is_rescue_recipe' = ?", "true") }
  scope :monthly_specials, -> { where("metadata->>'is_monthly_special' = ?", "true") }
end
