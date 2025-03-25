require "rails_helper"

RSpec.describe "Api::V1::Recipes", type: :request do
  describe "GET /api/v1/recipes" do
    before do
      create_list(:recipe, 3)
    end

    it "returns a successful response" do
      get api_v1_recipes_path
      expect(response).to have_http_status(:success)
    end

    it "returns all recipes" do
      get api_v1_recipes_path
      json_response = JSON.parse(response.body)
      expect(json_response["data"].size).to eq(3)
    end
  end

  describe "GET /api/v1/recipes/:id" do
    let(:recipe) { create(:recipe) }
    let(:ingredient) { create(:ingredient) }

    before do
      create(:recipe_ingredient, recipe: recipe, ingredient: ingredient)
      create(:step, recipe: recipe, order: 1)
      create(:step, recipe: recipe, order: 2)
    end

    context "when the recipe exists" do
      it "returns a successful response" do
        get api_v1_recipe_path(recipe)
        expect(response).to have_http_status(:success)
      end

      it "returns the requested recipe" do
        get api_v1_recipe_path(recipe)
        json_response = JSON.parse(response.body)
        expect(json_response["data"]["id"]).to eq(recipe.id.to_s)
        expect(json_response["data"]["attributes"]["title"]).to eq(recipe.title)
      end

      it "includes associated steps" do
        get api_v1_recipe_path(recipe)
        json_response = JSON.parse(response.body)
        included_steps = json_response["included"].select { |item| item["type"] == "steps" }
        expect(included_steps.size).to eq(2)
      end

      it "includes associated recipe_ingredients" do
        get api_v1_recipe_path(recipe)
        json_response = JSON.parse(response.body)
        included_recipe_ingredients = json_response["included"].select { |item| item["type"] == "recipe-ingredients" }
        expect(included_recipe_ingredients.size).to eq(1)
      end
    end

    context "when the recipe does not exist" do
      it "returns a not found status" do
        get api_v1_recipe_path(id: "nonexistent")
        expect(response).to have_http_status(:not_found)
      end

      it "returns an error message" do
        get api_v1_recipe_path(id: "nonexistent")
        json_response = JSON.parse(response.body)
        expect(json_response["error"]).to eq("Recipe not found")
      end
    end
  end
end
