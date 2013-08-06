# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = []
10.times do |n|
  users << {username: "User_#{n+1}", email: "user_#{n+1}@example.com",
             password: "password", password_confirmation: "password"}
end

User.create!(users)

xml = File.read("./public/example.xml")
open("http://www.brewtoad.com/recipes/firework-cream-ale.xml") do |file|
  xml2 = file.read
end

Recipe.create!({name: "test_recipe", user_id: 1, xml: xml })
Recipe.create!({name: "hopville_recipe", user_id: 2, xml: xml2})