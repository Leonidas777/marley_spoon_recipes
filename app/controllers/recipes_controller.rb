class RecipesController < ApplicationController
  def index
    @current_page = page
    @recipes = RecipeService.get_all(page: @current_page)
  end

  def show
    @recipe = RecipeService.get_by_id(params[:id])
    @tags = @recipe.tags.present? ? @recipe.tags : []
  end

  private

  def page
    params[:page].to_i.abs
  end
end
