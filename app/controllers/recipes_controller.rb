class RecipesController < ApplicationController
  def index
    @recipes = RecipeService.get_all(page: params[:page])
  end

  def show
    @recipe = RecipeService.get_by_id(params[:id])
    @tags = @recipe.tags.present? ? @recipe.tags : []
  end
end
