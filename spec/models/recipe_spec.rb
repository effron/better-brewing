require 'spec_helper'

describe Recipe do

  let (:xml) do
    open("http://www.brewtoad.com/recipes/firework-cream-ale.xml") do |file|
      file.read
    end
  end

  describe "Parses xml" do
    it "Creates with valid xml" do
      recipe = Recipe.create!({name: "test", xml: xml})

      expect(recipe.name).to eq("test")
    end
  end
end
