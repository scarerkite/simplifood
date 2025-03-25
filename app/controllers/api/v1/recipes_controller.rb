module Api
  module V1
    class RecipesController < ApplicationController
      def index
        recipes = Recipe.all
        render json: recipes, adapter: :json_api
      end

      def show
        recipe = Recipe.find(params[:id])
        render json: recipe, include: [ "steps", "recipe_ingredients", "recipe_ingredients.ingredient" ], adapter: :json_api
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Recipe not found" }, status: :not_found
      end
    end
  end
end
