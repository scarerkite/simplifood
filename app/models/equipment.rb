class Equipment < ApplicationRecord
  has_many :step_equipments, dependent: :destroy, inverse_of: :equipment
  has_many :steps, through: :step_equipments

  validates :name, presence: true, uniqueness: true
end
