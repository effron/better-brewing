# == Schema Information
#
# Table name: mash_notes
#
#  id           :integer          not null, primary key
#  brew_note_id :integer
#  time         :integer
#  temperature  :integer
#  body         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class MashNote < ActiveRecord::Base
  attr_accessible :body, :brew_note_id, :temperature, :time

  belongs_to :brew_note


end
