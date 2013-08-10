# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  xml        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recipe < ActiveRecord::Base
  attr_accessible :name, :user_id, :xml

  belongs_to :user
  has_many :brew_notes
  validates :name, :xml, presence: true
  validate :xml_is_valid, on: :create

  before_validation :cleanup_xml
  # Add various instance methods to pull out information from parsed recipe
  # without having to store it in various db tables. Assume only one recipe
  # in each XML file

  def recipe_object
    #THIS NEEDS TO BE MORE ROBUST. FIGURE OUT WHAT TO DO WITH ILLEGAL BEER XML
    begin
      @recipe_object ||= Beerxml.parse(xml)[0]
    rescue
      raise "Brewser could not parse XML"
    end
  end

  def xml_is_valid
    begin
      Beerxml.parse(xml)
    rescue
      errors.add(:xml, "can't be unparseable by Brewser")
    end
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

  def miscs
    recipe_object.miscs
  end

  def original_name
    recipe_object.name
  end

  def original_brewer
    recipe_object.brewer
  end

  def estimated_og
    recipe_object.calculate_og
  end

  def estimated_fg
    recipe_object.calculate_fg
  end

  def estimated_color
    recipe_object.color
  end

  def estimated_ibu
    recipe_object.ibus
  end

  def estimated_abv
    recipe_object.abv
  end

  def efficiency
    recipe_object.efficiency
  end
  
  def boil_time
    recipe_object.boil_time
  end

  def batch_size
    recipe_object.batch_size
  end

  #People are bad at beerxml. Clean up some found errors
  def cleanup_xml
    xml.gsub!(/<EFFICIENCY>-<\/EFFICIENCY>/, '<EFFICIENCY>0.0</EFFICIENCY>')
  end
end
