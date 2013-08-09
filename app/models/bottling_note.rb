# == Schema Information
#
# Table name: bottling_notes
#
#  id                   :integer          not null, primary key
#  brew_note_id         :integer
#  volume               :integer
#  priming_sugar_type   :string(255)
#  priming_sugar_amount :integer
#  body                 :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class BottlingNote < ActiveRecord::Base
  attr_accessible :body, :brew_note_id, :priming_sugar_amount,
                  :priming_sugar_type, :volume

  belongs_to :brew_note
end
