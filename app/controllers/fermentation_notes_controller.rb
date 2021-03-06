class FermentationNotesController < ApplicationController

  before_filter :authenticate_user!

  def update
    @fermentation_note = FermentationNote.find(params[:id])
    
    unless current_user.brew_notes.include?(@fermentation_note.brew_note)
      raise "NOT YOUR NOTE" 
    end
    
    @fermentation_note.update_attributes(params[:fermentation_note])
    if request.xhr?
      render partial: "brew_notes/fermentation_note",
             locals: { fermentation_note: @fermentation_note }
    else
      redirect_to @fermentation_note.brew_note
    end
  end

  def edit
    @fermentation_note = FermentationNote.find(params[:id])
    
    unless current_user.brew_notes.include?(@fermentation_note.brew_note)
      raise "NOT YOUR NOTE" 
    end
    
    if request.xhr?
      render partial: "brew_notes/fermentation_note_form",
             locals: { fermentation_note: @fermentation_note }
    else
      redirect_to @fermentation_note.brew_note
    end

  end
end