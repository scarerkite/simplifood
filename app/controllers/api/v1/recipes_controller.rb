module Api
  module V1
    class RecipesController < ApplicationController
      def index
        recipes = Recipe.all
        render json: recipes
      end

      def show
        recipe = Recipe.find(params[:id])
        render json: recipe
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Recipe not found" }, status: :not_found
      end
    end
  end
end
