require 'rails_helper'

RSpec.describe StepEquipment, type: :model do
  let(:step_equipment) { build(:step_equipment) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(step_equipment).to be_valid
    end

    it "is invalid without a title" do
      step_equipment.step = nil
      expect(step_equipment).to_not be_valid
    end
  end
end
