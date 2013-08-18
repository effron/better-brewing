# == Schema Information
#
# Table name: brew_notes
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  recipe_id               :integer
#  body                    :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  beer_photo_file_name    :string(255)
#  beer_photo_content_type :string(255)
#  beer_photo_file_size    :integer
#  beer_photo_updated_at   :datetime
#  mash_volume             :integer
#

class BrewNote < ActiveRecord::Base

  include UnitConversion

  attr_accessible :body, :recipe_id, :user_id, :fermentation_note_attributes,
                  :beer_photo, :boil_note_attributes, :mash_notes_attributes,
                  :bottling_note_attributes, :mash_volume, :mash_volume_gallons,
                  :sparge_note_attributes

  belongs_to :user
  belongs_to :recipe
  has_many :mash_notes, dependent: :destroy
  has_one :sparge_note, dependent: :destroy
  has_one :boil_note, dependent: :destroy
  has_one :fermentation_note, dependent: :destroy
  has_one :bottling_note, dependent: :destroy
  has_many :tasting_notes, dependent: :destroy
  accepts_nested_attributes_for :mash_notes, :boil_note, :fermentation_note,
                                :bottling_note, :sparge_note

  has_attached_file :beer_photo, styles: {
    big: "600x600>",
    small: "50x50#"
  }



end
