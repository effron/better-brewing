class BottlingNote < ActiveRecord::Base
  attr_accessible :body, :brew_note_id, :priming_sugar_amount,
                  :priming_sugar_type, :volume

  belongs_to :brew_note
end
