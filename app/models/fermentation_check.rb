class FermentationCheck < ActiveRecord::Base
  attr_accessible :body, :elapsed_time, :fermentation_note_id,
                  :specific_gravity, :temperature

  belongs_to :fermentation_note
end
