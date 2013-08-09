# == Schema Information
#
# Table name: fermentation_checks
#
#  id                   :integer          not null, primary key
#  fermentation_note_id :integer
#  temperature          :integer
#  specific_gravity     :integer
#  body                 :text
#  elapsed_time         :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class FermentationCheck < ActiveRecord::Base
  attr_accessible :body, :elapsed_time, :fermentation_note_id,
                  :specific_gravity, :temperature

  belongs_to :fermentation_note
end
