require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  let(:recipe_ingredient) { build(:recipe_ingredient) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(recipe_ingredient).to be_valid
    end

    it "is invalid without a title" do
      recipe_ingredient.recipe = nil
      expect(recipe_ingredient).to_not be_valid
    end
  end
end
