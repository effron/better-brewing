# == Schema Information
#
# Table name: boil_notes
#
#  id               :integer          not null, primary key
#  brew_note_id     :integer
#  pre_boil_volume  :integer
#  post_boil_volume :integer
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class BoilNote < ActiveRecord::Base
  attr_accessible :body, :brew_note_id, :post_boil_volume, :pre_boil_volume

  belongs_to :brew_note
  
  def average_volume
    return 0 unless post_boil_volume && pre_boil_volume
    (post_boil_volume + pre_boil_volume) / 2
  end
end
