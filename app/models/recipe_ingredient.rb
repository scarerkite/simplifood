class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, inverse_of: :recipe_ingredients
  belongs_to :ingredient, inverse_of: :recipe_ingredients

  validates :quantity, :unit, presence: true

  enum :unit, {
    gram: 0,
    kg: 1,
    ml: 2,
    litre: 3,
    tsp: 4,
    tbsp: 5,
    cup: 6,
    piece: 7,
    pinch: 8,
    whole: 9,
    other: 10
  }, default: :other
end
