class MashNotesController < ApplicationController

  def create
    @mash_note = MashNote.new(params[:mash_note])
    @mash_note.save!
    if request.xhr?
      render partial: "brew_notes/mash_note", locals: { mash_note: @mash_note }
    else
      redirect_to @mash_note.brew_note
    end
  end

  def update
    @mash_note = MashNote.find(params[:id])
    @mash_note.update_attributes(params[:mash_note])
    if request.xhr?
      render partial: "brew_notes/mash_note_row", locals: { mash_note: @mash_note }
    else
      redirect_to @mash_note.brew_note
    end
  end

  def edit
    @mash_note = MashNote.find(params[:id])
    if request.xhr?
      render partial: "brew_notes/mash_note", locals: { mash_note: @mash_note }
    else
      redirect_to @mash_note.brew_note
    end
  end

  def destroy
    @mash_note = MashNote.find(params[:id])
    @mash_note.destroy
    if request.xhr?
      render partial: "brew_notes/mash_note", locals: { mash_note: @mash_note }
    else
      redirect_to @mash_note.brew_note
    end
  end
end