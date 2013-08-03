class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to @recipe
    else
      flash[:notice] = "Could not create recipe"
      render :new
    end
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url
  end
end