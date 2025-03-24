require 'rails_helper'

RSpec.describe Step, type: :model do
  let(:step) { build(:step) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(step).to be_valid
    end

    it "is invalid without an instruction" do
      step.instruction = nil
      expect(step).to_not be_valid
    end
  end
end
