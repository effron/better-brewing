class BoilNote < ActiveRecord::Base
  attr_accessible :body, :brew_note_id, :post_boil_volume, :pre_boil_volume

  belongs_to :brew_note
end
