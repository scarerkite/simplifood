class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit, :critical

  belongs_to :ingredient
  belongs_to :recipe
end
