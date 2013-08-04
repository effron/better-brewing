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
  
  def estimated_og
    if recipe_object.estimated_og == 0
      calculate_estimated_og
    else
      recipe_object.estimated_og
    end
  end
  
  def estimated_fg
    if recipe_object.estimated_fg == 0
      calculate_estimated_fg
    else
      recipe_object.estimated_fg
    end
  end
  
  def estimated_color
    if recipe_object.estimated_color == 0
      calculate_estimated_color
    else
      recipe_object.estimated_color
    end
  end
  
  def estimated_ibu
    if recipe_object.estimated_ibu == 0
      calculate_estimated_ibu
    else
      recipe_object.estimated_ibu
    end
  end
  
  def estimated_abv
    if recipe_object.estimated_abv == 0
      calculate_estimated_abv
    else
      recipe_object.estimated_abv
    end
  end

  def boil_time
    recipe_object.boil_time
  end
  
  def method
    recipe_object.method
  end
  
  def recipe_volume
    recipe_object.recipe_volume
  end
  
  def xml_is_url?
    xml =~ /^https?:\/\/.*\.xml$/i
  end
  
  def read_xml_from_url
    open(xml) do |file|
      self.xml = file.read
    end
  end

  private
  
    def calculate_estimated_og
      # figure out how to calculate estimated og from malts information
      # Brewtoad can do it!
      1.060 #placeholder for testing
    end
  
    def calculate_estimated_fg
      # figure out how to calculate estimated fg from malts/yeasts information
      # Brewtoad can do it!
      1.010 #placeholder for testing
    end
    
    def calculate_estimated_color
      # figure it out!
      40 #placeholder
    end

    def calculate_estimated_ibu
      # figure it out!
      60 #placeholder
    end
    
    def calculate_estimated_abv
      # figure it out!
      8
    end
end
