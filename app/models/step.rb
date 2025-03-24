class Step < ApplicationRecord
  belongs_to :recipe, inverse_of: :steps

  has_many :step_ingredients, dependent: :destroy, inverse_of: :step
  has_many :ingredients, through: :step_ingredients
  has_many :step_equipments, dependent: :destroy, inverse_of: :step
  has_many :equipment, through: :step_equipments

  validates :instruction, :order, presence: true
  validates :order, numericality: { only_integer: true, greater_than: 0 }
end
