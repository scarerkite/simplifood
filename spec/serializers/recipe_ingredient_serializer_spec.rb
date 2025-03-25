require "rails_helper"

RSpec.describe RecipeIngredientSerializer do
  let(:recipe) { create(:recipe) }
  let(:ingredient) { create(:ingredient) }
  let!(:recipe_ingredient) { create(:recipe_ingredient, recipe: recipe, ingredient: ingredient) }
  let(:serialized_recipe_ingredient) {
    ActiveModelSerializers::SerializableResource.new(
      recipe_ingredient,
      serializer: RecipeIngredientSerializer,
      include: [ "ingredient", "recipe" ],
      adapter: :json_api
    ).as_json
  }

  # JSON API format converts attribute names to kebab-case
  it "includes the expected attributes" do
    expect(serialized_recipe_ingredient[:data][:attributes].keys).to match_array([
      :quantity, :unit, :critical
    ])
    expect(serialized_recipe_ingredient[:data][:id]).to eq(recipe_ingredient.id.to_s)
    expect(serialized_recipe_ingredient[:data][:type]).to eq("recipe-ingredients")
  end

  it "includes nested associations" do
    expect(serialized_recipe_ingredient[:data][:relationships].keys).to include(:ingredient, :recipe)

    included_data = serialized_recipe_ingredient[:included]
    ingredient_data = included_data.find do |item|
      item[:type] == "ingredients" &&
      item[:id] == ingredient.id.to_s
    end

    recipe_data = included_data.find do |item|
      item[:type] == "recipes" &&
      item[:id] == recipe.id.to_s
    end

    expect(recipe_data[:attributes][:title]).to eq(recipe.title)
    expect(ingredient_data[:attributes][:name]).to eq(ingredient.name)
  end
end
