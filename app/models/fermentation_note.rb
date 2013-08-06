class FermentationNote < ActiveRecord::Base
  attr_accessible :body, :brew_note_id, :fg, :og, :volume,
                  :fermentation_checks_attributes

  belongs_to :brew_note
  has_many :fermentation_checks
  accepts_nested_attributes_for :fermentation_checks
end
