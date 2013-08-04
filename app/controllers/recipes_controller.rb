class RecipesController < ApplicationController
  
  before_filter :authenticate_user!, only: [:new, :create, :destroy]
  
  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def create
    @recipe = current_user.recipes.build(params[:recipe])
    
    if @recipe.xml_is_url?
      @recipe.read_xml_from_url
    end
    
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