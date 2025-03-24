require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:ingredient) { build(:ingredient) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(ingredient).to be_valid
    end

    it "is invalid without a name" do
      ingredient.name = nil
      expect(ingredient).to_not be_valid
    end
  end
end
