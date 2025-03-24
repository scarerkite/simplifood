class StepSerializer < ActiveModel::Serializer
  attributes :id, :instruction, :order, :time_in_minutes, :optional

  has_many :step_ingredients
  has_many :step_equipments
end
