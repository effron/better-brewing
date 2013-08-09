# == Schema Information
#
# Table name: serving_vessels
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ServingVessel < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :tasting_notes
end
