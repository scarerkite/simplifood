require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) { build(:recipe) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(recipe).to be_valid
    end

    it "is invalid without a title" do
      recipe.title = nil
      expect(recipe).to_not be_valid
    end

    it "is invalid with complexity rating outside range" do
      recipe.complexity_rating = 6
      expect(recipe).to_not be_valid
    end
  end

  describe "scopes" do
    it "returns rescue recipes" do
      create(:recipe, metadata: { is_rescue_recipe: false })
      rescue_recipe = create(:recipe, metadata: { is_rescue_recipe: true })

      expect(Recipe.rescue_recipes).to include(rescue_recipe)
      expect(Recipe.rescue_recipes.count).to eq(1)
    end

    it "returns monthly specials" do
      create(:recipe, metadata: { is_monthly_special: false })
      monthly = create(:recipe, metadata: { is_monthly_special: true })

      expect(Recipe.monthly_specials).to include(monthly)
      expect(Recipe.monthly_specials.count).to eq(1)
    end
  end
end
