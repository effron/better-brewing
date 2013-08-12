# == Schema Information
#
# Table name: fermentation_notes
#
#  id           :integer          not null, primary key
#  brew_note_id :integer
#  volume       :integer
#  og           :integer
#  fg           :integer
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FermentationNote < ActiveRecord::Base
  include UnitConversion

  attr_accessible :body, :brew_note_id, :fg, :og, :volume,
                  :fermentation_checks_attributes, :volume_gallons

  belongs_to :brew_note
  has_many :fermentation_checks
  accepts_nested_attributes_for :fermentation_checks
end
