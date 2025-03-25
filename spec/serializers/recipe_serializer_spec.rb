require "rails_helper"

RSpec.describe RecipeSerializer do
  let(:recipe) { create(:recipe) }
  let(:ingredient) { create(:ingredient) }
  let!(:recipe_ingredient) { create(:recipe_ingredient, recipe: recipe, ingredient: ingredient) }
  let!(:step) { create(:step, recipe: recipe, order: 1) }
  let(:serialized_recipe) {
    ActiveModelSerializers::SerializableResource.new(
      recipe,
      serializer: RecipeSerializer,
      include: [ "steps", "recipe_ingredients", "recipe_ingredients.ingredient" ],
      adapter: :json_api
    ).as_json
  }

  # JSON API format converts attribute names to kebab-case
  it "includes the expected attributes" do
    expect(serialized_recipe[:data][:attributes].keys).to match_array([
      :title, :description, :"time-in-minutes",
      :portions, :"complexity-rating", :metadata
    ])
    expect(serialized_recipe[:data][:id]).to eq(recipe.id.to_s)
    expect(serialized_recipe[:data][:type]).to eq("recipes")
  end

  it "includes nested associations" do
    expect(serialized_recipe[:data][:relationships].keys).to include(:steps, :"recipe-ingredients")

    included_data = serialized_recipe[:included]
    ingredient_data = included_data.find do |item|
      item[:type] == "ingredients" &&
      item[:id] == ingredient.id.to_s
    end

    recipe_ingredient_data = included_data.find do |item|
      item[:type] == "recipe-ingredients" &&
      item[:id] == recipe_ingredient.id.to_s
    end

    step_data = included_data.find do |item|
      item[:type] == "steps" &&
      item[:id] == step.id.to_s
    end

    expect(recipe_ingredient_data[:relationships][:ingredient][:data][:id]).to eq(ingredient.id.to_s)
    expect(ingredient_data[:attributes][:name]).to eq(ingredient.name)
    expect(step_data[:attributes][:instruction]).to be_present
  end
end
