class BrewNote < ActiveRecord::Base
  attr_accessible :body, :integer, :recipe_id, :user_id, :mash_notes_attributes

  belongs_to :user
  belongs_to :recipe
  has_many :mash_notes

  accepts_nested_attributes_for :mash_notes
end
