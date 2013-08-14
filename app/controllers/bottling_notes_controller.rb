class BottlingNotesController < ApplicationController

  before_filter :authenticate_user!

  def update
    @bottling_note = BottlingNote.find(params[:id])

    unless current_user.brew_notes.include?(@bottling_note.brew_note)
      raise "NOT YOUR NOTE"
    end

    @bottling_note.update_attributes(params[:bottling_note])
    if request.xhr?
      render partial: "brew_notes/bottling_note",
             locals: { bottling_note: @bottling_note }
    else
      redirect_to @bottling_note.brew_note
    end
  end

  def edit
    @bottling_note = BottlingNote.find(params[:id])

    unless current_user.brew_notes.include?(@bottling_note.brew_note)
      raise "NOT YOUR NOTE"
    end

    if request.xhr?
      render partial: "brew_notes/bottling_note_form",
             locals: { bottling_note: @bottling_note }
    else
      redirect_to @bottling_note.brew_note
    end

  end
end