class RecipesController < ApplicationController
  def index
    @recipes = RecipeService.get_all
  end

  def show
    @recipe = RecipeService.get_by_id(params[:id])
  end
end
