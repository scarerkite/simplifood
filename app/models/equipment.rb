class Equipment < ApplicationRecord
  has_many :step_equipment
  has_many :steps, through: :step_equipment

  validates :name, presence: true, uniqueness: true
end
