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

    if @brew_note.save
      redirect_to @brew_note
    else
      flash[:notice] = "Could not create brew note"
      render :new
    end
  end

  def show
    @brew_note = BrewNote.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

end