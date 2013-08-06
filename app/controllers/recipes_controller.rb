class RecipesController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create

    xml_url = params[:xml_url]
    uploaded_recipe = params[:xml_file]

    if !xml_url.blank?
      open(xml_url) do |file|
        params[:recipe][:xml] = file.read
      end
    elsif !uploaded_recipe.blank?
      params[:recipe][:xml] = uploaded_recipe.read
    end

    @recipe = current_user.recipes.build(params[:recipe])

    if @recipe.save
      flash[:notice] = "Recipe created!"
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