class StepIngredientSerializer < ActiveModel::Serializer
  attributes :id, :optional

  belongs_to :step
  belongs_to :ingredient
end
