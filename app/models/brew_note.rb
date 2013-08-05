class BrewNote < ActiveRecord::Base
  attr_accessible :body, :integer, :recipe_id, :user_id

  belongs_to :user
  belongs_to :recipe
end
