class Recipe < ActiveRecord::Base
  attr_accessible :name, :user_id, :xml
  
  belongs_to :user
  
  # Add various instance methods to pull out information from parsed recipe 
  # without having to store it in various db tables. Assume only one recipe 
  # in each XML file
  
  def recipe_object
    @recipe_object ||= Brewser.parse(xml)[0]
  end
  
  def hops
    recipe_object.hops
  end
  
  def fermentables
    recipe_object.fermentables
  end
  
  def yeasts
    recipe_object.yeasts
  end
  
  def additives
    recipe_object.additives
  end
  
  def original_name
    recipe_object.name
  end
  
  def original_brewer
    recipe_object.brewer
  end
  
end
