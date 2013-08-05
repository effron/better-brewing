class MashNote < ActiveRecord::Base
  attr_accessible :body, :brew_note_id, :temperature, :time

  belongs_to :brew_note


end
