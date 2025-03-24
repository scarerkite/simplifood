class Step < ApplicationRecord
  belongs_to :recipe

  has_many :step_ingredients, dependent: :destroy
  has_many :ingredients, through: :step_ingredients
  has_many :step_equipment, dependent: :destroy
  has_many :equipment, through: :step_equipment

  validates :instruction, :order, presence: true
  validates :order, numericality: { only_integer: true, greater_than: 0 }
end
