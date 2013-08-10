# == Schema Information
#
# Table name: sparge_notes
#
#  id           :integer          not null, primary key
#  brew_note_id :integer
#  temperature  :integer
#  volume       :integer
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SpargeNote < ActiveRecord::Base
  attr_accessible :body, :brew_note_id, :temperature, :volume
  
  belongs_to :brew_note
end
