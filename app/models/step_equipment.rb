class StepEquipment < ApplicationRecord
  belongs_to :step, inverse_of: :step_equipments
  belongs_to :equipment, inverse_of: :step_equipments
end
