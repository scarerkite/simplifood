class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :step_ingredients
  has_many :steps, through: :step_ingredients

  enum :category, {
    meat: 0,
    poultry: 1,
    seafood: 2,
    dairy: 3,
    egg: 4,
    vegetable: 5,
    fruit: 6,
    grain: 7,
    legume: 8,
    nut: 9,
    seed: 10,
    herb: 11,
    spice: 12,
    oil: 13,
    sweetener: 14,
    condiment: 15,
    other: 16
  }, default: :other

  validates :name, presence: true, uniqueness: true
end
