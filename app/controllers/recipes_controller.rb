class RecipesController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @recipes = Recipe.select("recipes.*, COUNT(children.id) AS child_count").
      joins("LEFT OUTER JOIN recipes AS children ON children.parent_id = recipes.id").
      group("recipes.id").
      order("child_count").
      reverse_order.page(params[:page]).per(12)

    if request.xhr?
      render partial: "page", locals: { recipes: @recipes }
    end
  end

  def search
    if params[:search].blank?
      @recipes = Recipe.select("recipes.*, COUNT(children.id) AS child_count").
                        joins("LEFT OUTER JOIN recipes AS children ON children.parent_id = recipes.id").
                        group("recipes.id").
                        order("child_count").
                        reverse_order.page(params[:page]).per(12)
    else
      @recipes = Recipe.find_by_fuzzy_name(params[:search])
      @recipes = Kaminari.paginate_array(@recipes).page(params[:page]).per(12)
    end

    if request.xhr?
      render partial: "search_results", locals: { recipes: @recipes }
    else
      render :index
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create

    xml_url = params[:xml_url]
    uploaded_recipe = params[:xml_file]

    if !xml_url.blank?
      begin
        open(xml_url.strip) do |file|
          params[:recipe][:xml] = file.read
        end
      rescue
        flash[:notice] = "Bad url. Please double check to make sure it leads to pure BeerXML"
        @recipe = current_user.recipes.build(params[:recipe])
        render :new
        return
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