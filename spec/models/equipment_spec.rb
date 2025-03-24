require "rails_helper"

RSpec.describe Equipment, type: :model do
  let(:equipment) { build(:equipment) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(equipment).to be_valid
    end

    it "is invalid without a name" do
      equipment.name = nil
      expect(equipment).to_not be_valid
    end
  end
end
