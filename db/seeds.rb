# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# users = []
# 10.times do |n|
#   users << {username: "User_#{n+1}", email: "user_#{n+1}@example.com",
#              password: "password", password_confirmation: "password"}
# end
# 
# User.create!(users)

# xml = File.read("./public/example.xml")
# xml2 = ""
# open("http://www.brewtoad.com/recipes/firework-cream-ale.xml") do |file|
#   xml2 = file.read
# end
# 
# Recipe.create!({name: "test_recipe", user_id: 1, xml: xml })
# Recipe.create!({name: "hopville_recipe", user_id: 2, xml: xml2})

## Seed consumption vessels

# consumption_vessels = [
#   {name: "Shaker Pint"},
#   {name: "Tulip Pint"},
#   {name: "Nonic Pint"},
#   {name: "Snifter"},
#   {name: "Tulip"},
#   {name: "Goblet"},
#   {name: "Pilsner Glass"},
#   {name: "Weizen Vase"},
#   {name: "Flute"},
#   {name: "Stein"},
#   {name: "Seidel"},
#   {name: "Schnitt Glass"},
#   {name: "Pokal Glass"},
#   {name: "Stange Glass"},
#   {name: "Dwarf Glass"}
# ]
# 
# ConsumptionVessel.create!(consumption_vessels)

## Seed serving vessels

# serving_vessels = [
#  {name: "Draft"},
#  {name: "Cask"},
#  {name: "Bottle"},
#  {name: "Can"},
#  {name: "Growler"}   
# ]
# 
# ServingVessel.create!(serving_vessels)

#Seeding a demo user
old_user = User.find_by_username_and_email("demo_user", "demo_user@example.com")
old_user.destroy if old_user

demo = User.create!({ username: "demo_user", email:"demo_user@example.com", 
                      password: "password", password_confirmation: "password" })

xml = ""
open("http://www.brewtoad.com/recipes/firework-cream-ale.xml") do |file|
  xml = file.read
end

demo.recipes.create({name: "demo_recipe", user_id: 1, xml: xml })

demo.recipes.first.brew_notes.create({
  user_id: demo.id,
  body: "Brewed this recipe on my stovetop using a 7 gallon aluminum pot",
  mash_volume_gallons: 1  
})

demo.brew_notes.first.mash_notes.create({
  temperature: 155,
  time: 60,
})

demo.brew_notes.first.mash_notes.create({
  temperature: 150,
  time: 45,
})

demo.brew_notes.first.mash_notes.create({
  temperature: 145,
  time: 30,
  body: "turned on heat",
})

demo.brew_notes.first.mash_notes.create({
  temperature: 155,
  time: 15,
  body: "turned off heat",
})

demo.brew_notes.first.mash_notes.create({
  temperature: 153,
  time: 0,
})

demo.brew_notes.first.create_sparge_note({
  temperature: 175, 
  volume_gallons: 2.25,
  body: "dunked grains into sparge water 2 times"
})

demo.brew_notes.first.create_boil_note({
  pre_boil_volume_gallons: 6.5,
  post_boil_volume_gallons: 4.5
})

demo.brew_notes.first.create_fermentation_note({
  volume_gallons: 5.25,
  og: 1055,
  fg: 1017,
  body: "Fermented in 6.5 gallon plastic bucket",
  fermentation_checks_attributes: [
    { 
      temperature: 75,
      elapsed_time: 1,
      specific_gravity: 1050
    },
    { 
      temperature: 78,
      elapsed_time: 4,
      specific_gravity: 1042,
      body: "Too hot!"
    },
    { 
      temperature: 72,
      elapsed_time: 7,
      specific_gravity: 1020
    },
    { 
      temperature: 70,
      elapsed_time: 12,
      specific_gravity: 1017
    },
    { 
      temperature: 73,
      elapsed_time: 14,
      specific_gravity: 1017
    }
  ]
})

demo.brew_notes.first.create_bottling_note({
  volume_gallons: 4.5,
  priming_sugar_type: "dextrose",
  priming_sugar_amount: 5,
  body: "no hicups on bottling day"  
})

demo.brew_notes.first.tasting_notes.create({
  alcohol: 3, bitter: 2, body: 4, burnt: 1, citrus_fruit: 4, dark_fruit: 5, 
  dry: 5, floral: 3, herbal: 3, hoppy: 2, linger: 5, malty: 4, sour: 1, 
  spicy: 1, sweet: 5, toffee: 3, rating: 9,
  appearance: "Slightly cloudy, light in color", 
  aroma: "Strong, sweet aroma", 
  flavor: "Tastes sweeter than I was hoping for",
  misc: "Pretty happy with how it turned out. Slightly too sweet all around", 
  serving_vessel_id: 3, consumption_vessel_id: 2  
})

demo.brew_notes.first.tasting_notes.create({
  alcohol: 3, bitter: 1, body: 4, burnt: 1, citrus_fruit: 4, dark_fruit: 5, 
  dry: 5, floral: 3, herbal: 3, hoppy: 2, linger: 5, malty: 4, sour: 3, 
  spicy: 2, sweet: 5, toffee: 3, rating: 7,
  appearance: "Very cloudy", 
  aroma: "Strong, vegetably", 
  flavor: "Some odd sourness in this one",
  misc: "Maybe something is wrong with this bottle. More sour than intended", 
  serving_vessel_id: 3, consumption_vessel_id: 2  
})

demo.recipes.first.brew_notes.create({
  user_id: demo.id,
  body: "Brewed outside on my driveway using propane burner",
  mash_volume_gallons: 1.25  
})

demo.brew_notes.last.mash_notes.create({
  temperature: 152,
  time: 60,
})

demo.brew_notes.last.mash_notes.create({
  temperature: 145,
  time: 45,
  body: "too cold! turned on burner"
})

demo.brew_notes.last.mash_notes.create({
  temperature: 160,
  time: 30,
  body: "too hot! turned off burner, stirred vigorously"
})

demo.brew_notes.last.mash_notes.create({
  temperature: 158,
  time: 15,
})

demo.brew_notes.last.mash_notes.create({
  temperature: 156,
  time: 0
})

demo.brew_notes.last.create_sparge_note({
  temperature: 180, 
  volume_gallons: 2
})

demo.brew_notes.last.create_boil_note({
  pre_boil_volume_gallons: 6,
  post_boil_volume_gallons: 4.25
})

demo.brew_notes.last.create_fermentation_note({
  volume_gallons: 5,
  og: 1060,
  fg: 1015,
  body: "Fermented in 6.5 gallon glass carboy",
  fermentation_checks_attributes: [
    { 
      temperature: 70,
      elapsed_time: 1,
      specific_gravity: 1058
    },
    { 
      temperature: 72,
      elapsed_time: 3,
      specific_gravity: 1055,
    },
    { 
      temperature: 72,
      elapsed_time: 9,
      specific_gravity: 1035
    },
    { 
      temperature: 68,
      elapsed_time: 12,
      specific_gravity: 1019
    },
    { 
      temperature: 73,
      elapsed_time: 14,
      specific_gravity: 1015
    }
  ]
})

demo.brew_notes.last.create_bottling_note({
  volume_gallons: 4.25,
  priming_sugar_type: "honey",
  priming_sugar_amount: 4,
  body: "boiled honey in 2 cups water"  
})

demo.brew_notes.last.tasting_notes.create({
  alcohol: 2, bitter: 2, body: 5, burnt: 4, citrus_fruit: 2, dark_fruit: 4, 
  dry: 5, floral: 3, herbal: 3, hoppy: 4, linger: 5, malty: 4, sour: 2, 
  spicy: 1, sweet: 5, toffee: 3, rating: 7,
  appearance: "Clear as day", 
  aroma: "Smells burnt, kind of smoky", 
  flavor: "Strong burnt notes hide other flavors",
  serving_vessel_id: 3, consumption_vessel_id: 4  
})

demo.brew_notes.last.tasting_notes.create({
  alcohol: 2, bitter: 2, body: 4, burnt: 1, citrus_fruit: 4, dark_fruit: 5, 
  dry: 4, floral: 4, herbal: 3, hoppy: 2, linger: 5, malty: 4, sour: 3, 
  spicy: 3, sweet: 4, toffee: 3, rating: 7,
  appearance: "Very cloudy", 
  aroma: "less burnt than last time i tasted it",
  flavor: "burnt flavor subsided a lot",
  misc: "glad the burnt off flavor went away after aging", 
  serving_vessel_id: 5, consumption_vessel_id: 6  
})




