class Recipe < ActiveRecord::Base
  attr_accessible :name, :user_id, :xml
  
  belongs_to :user
  
end
