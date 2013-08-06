class BrewNote < ActiveRecord::Base
  attr_accessible :body, :recipe_id, :user_id, :mash_notes_attributes,
                  :beer_photo

  belongs_to :user
  belongs_to :recipe
  has_many :mash_notes

  accepts_nested_attributes_for :mash_notes
  
  has_attached_file :beer_photo, styles: {
    big: "600x600>",
    small: "50x50#"
  }
  
end
