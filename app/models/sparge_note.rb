class SpargeNote < ActiveRecord::Base
  attr_accessible :body, :brew_note_id, :temperature, :volume
  
  belongs_to :brew_note
end
