class FermentationChecksController < ApplicationController

  def create
    @fermentation_check = FermentationCheck.new(params[:fermentation_check])
    @fermentation_check.save!
    if request.xhr?
      render partial: "brew_notes/fermentation_check", locals: {fermentation_check: @fermentation_check}
    else
      redirect_to @fermentation_check.fermentation_note.brew_note
    end
  end

  def update
    @fermentation_check = FermentationCheck.find(params[:id])
    @fermentation_check.update_attributes(params[:fermentation_check])
    if request.xhr?
      render partial: "brew_notes/fermentation_check_row", locals: {fermentation_check: @fermentation_check}
    else
      redirect_to @fermentation_check.fermentation_note.brew_note
    end
  end

  def edit
    @fermentation_check = FermentationCheck.find(params[:id])
    if request.xhr?
      render partial: "brew_notes/fermentation_check", locals: {fermentation_check: @fermentation_check}
    else
      redirect_to @fermentation_check.fermentation_note.brew_note
    end
  end

  def destroy
    @fermentation_check = FermentationCheck.find(params[:id])
    @fermentation_check.destroy
    if request.xhr?
      render partial: "brew_notes/fermentation_check", locals: {fermentation_check: @fermentation_check}
    else
      redirect_to @fermentation_check.fermentation_note.brew_note
    end
  end
end