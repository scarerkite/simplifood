require 'rails_helper'

RSpec.describe StepIngredient, type: :model do
  let(:step_ingredient) { build(:step_ingredient) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(step_ingredient).to be_valid
    end

    it "is invalid without a title" do
      step_ingredient.step = nil
      expect(step_ingredient).to_not be_valid
    end
  end
end
