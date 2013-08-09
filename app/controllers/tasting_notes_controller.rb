class TastingNotesController < ApplicationController
  def index
    if params[:brew_note_id]
      @tasting_notes = TastingNote.find_all_by_brew_note_id(params[:brew_note_id])
    else
      @tasting_notes = current_user.tasting_notes
    end
  end
  
  def new
    @tasting_note = BrewNote.find(params[:brew_note_id]).tasting_notes.new
  end
  
  def create
    @tasting_note = BrewNote.find(params[:brew_note_id]).tasting_notes.
                             build(params[:tasting_note])
    if @tasting_note.save
      redirect_to @tasting_note
    else
      flash[:notice] = "Could not create tasting note"
      render :new
    end
  end
  
  def show
    @tasting_note = TastingNote.find(params[:id])
  end
  
  def edit
    @tasting_note = TastingNote.find(params[:id])
  end 
  
  def update
    @tasting_note = TastingNote.find(params[:id])
    @tasting_note.update_attributes(params[:tasting_note])
    redirect_to @tasting_note
  end
  
  def destroy
    @tasting_note = TastingNote.find(params[:id])
    
    raise "NOT YOUR TASTING NOTE" unless current_user.include?(@tasting_note)
    
    @tasting_note.destroy
    
    flash[:notice] = "Deleted tasting note for #{@tasting_note.brew_note.recipe}"
    
    redirect_to tasting_notes_url
  end
end