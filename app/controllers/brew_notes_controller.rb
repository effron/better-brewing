class BrewNotesController < ApplicationController

  before_filter :authenticate_user!

  def index
    if params[:recipe_id]
      @brew_notes = BrewNote.find_all_by_recipe_id(params[:recipe_id])
    else
      @brew_notes = current_user.brew_notes
    end
  end

  def new
    @brew_note = Recipe.find(params[:recipe_id]).brew_notes.new
  end

  def create
    if params[:brew_note][:recipe_id] != params[:recipe_id]
      raise "Don't change the recipe_id"
    end

    @brew_note = current_user.brew_notes.build(params[:brew_note])

    if @brew_note.user_id != @brew_note.recipe.user_id
      raise "That's not your recipe!"
    end

    if @brew_note.save
      if request.xhr?
        render partial: "mash_notes", locals: { brew_note: @brew_note }
      else
        redirect_to @brew_note
      end
    else
      flash[:notice] = "Could not create brew note"
      render :new
    end
  end

  def show
    @brew_note = BrewNote.find(params[:id])

    if request.xhr?
      render partial: "brew_note_compare", locals: { brew_note: @brew_note }
    else
      render :show
    end
  end

  def edit
    @brew_note = BrewNote.find(params[:id])
  end

  def update
    @brew_note = BrewNote.find(params[:id])
    @brew_note.update_attributes(params[:brew_note])

    if request.url =~ /\?mash/ && request.xhr?
      render partial: "sparge_note", locals: { brew_note: @brew_note }
    elsif request.url =~ /\?sparge/ && request.xhr?
      render partial: "boil_note", locals: { brew_note: @brew_note }
    elsif request.url =~/\?boil/ && request.xhr?
      render partial: "brew_day_fermentation_note", locals: { brew_note: @brew_note }
    else
      redirect_to @brew_note
    end
  end

  def destroy
    @brew_note = BrewNote.find(params[:id])
    raise "NOT YOUR NOTE" unless current_user.brew_notes.include?(@brew_note)
    
    @brew_note.destroy
    
    flash[:notice] = "Deleted brew note for #{@brew_note.recipe.name}"
    
    redirect_to brew_notes_url
  end

end