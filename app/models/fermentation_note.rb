class FermentationNote < ActiveRecord::Base
  attr_accessible :body, :brew_note_id, :fg, :og, :volume

  belongs_to :brew_note
end
