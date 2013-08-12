class FermentationChecksController < ApplicationController

  before_filter :authenticate_user!

  def create
    @fermentation_check = FermentationCheck.new(params[:fermentation_check])
    unless current_user.brew_notes.include?(@fermentation_check.fermentation_note.brew_note)
      raise "NOT YOUR NOTE" 
    end
    
    @fermentation_check.save!
    if request.xhr?
      render partial: "brew_notes/fermentation_check", locals: {fermentation_check: @fermentation_check}
    else
      redirect_to @fermentation_check.fermentation_note.brew_note
    end
  end

  def update
    @fermentation_check = FermentationCheck.find(params[:id])
    unless current_user.brew_notes.include?(@fermentation_check.fermentation_note.brew_note)
      raise "NOT YOUR NOTE" 
    end
    
    @fermentation_check.update_attributes(params[:fermentation_check])
    if request.xhr?
      render partial: "brew_notes/fermentation_check_row", locals: {fermentation_check: @fermentation_check}
    else
      redirect_to @fermentation_check.fermentation_note.brew_note
    end
  end

  def edit
    @fermentation_check = FermentationCheck.find(params[:id])
    
    unless current_user.brew_notes.include?(@fermentation_check.fermentation_note.brew_note)
      raise "NOT YOUR NOTE" 
    end
    
    if request.xhr?
      render partial: "brew_notes/fermentation_check", locals: {fermentation_check: @fermentation_check}
    else
      redirect_to @fermentation_check.fermentation_note.brew_note
    end
  end

  def destroy
    @fermentation_check = FermentationCheck.find(params[:id])
    
    
    unless current_user.brew_notes.include?(@fermentation_check.fermentation_note.brew_note)
      raise "NOT YOUR NOTE" 
    end
    
    @fermentation_check.destroy
    if request.xhr?
      render partial: "brew_notes/fermentation_check", locals: {fermentation_check: @fermentation_check}
    else
      redirect_to @fermentation_check.fermentation_note.brew_note
    end
  end
end