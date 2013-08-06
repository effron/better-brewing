class BrewNote < ActiveRecord::Base
  attr_accessible :body, :recipe_id, :user_id, :fermentation_note_attributes,
                  :beer_photo, :boil_note_attributes, :mash_notes_attributes,
                  :bottling_note_attributes

  belongs_to :user
  belongs_to :recipe
  has_many :mash_notes
  has_one :boil_note
  has_one :fermentation_note
  has_one :bottling_note
  accepts_nested_attributes_for :mash_notes, :boil_note, :fermentation_note,
                                :bottling_note

  has_attached_file :beer_photo, styles: {
    big: "600x600>",
    small: "50x50#"
  }

end
