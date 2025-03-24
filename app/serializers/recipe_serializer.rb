class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :time_in_minutes, :portions, :complexity_rating, :metadata

  has_many :steps
  has_many :recipe_ingredients
end
