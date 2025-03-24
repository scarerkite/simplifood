class StepIngredient < ApplicationRecord
  belongs_to :step, inverse_of: :step_ingredients
  belongs_to :ingredient, inverse_of: :step_ingredients
end
