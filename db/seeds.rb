# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name:  "Example User",
                   email: "example@email.org",
                   password:              "foobars",
                   password_confirmation: "foobars",
                   service: true,
                   admin: true)

menu = Menu.create(description: "Best pizza place in town",
                    user: user)

MenuItem.create(item: "LRG Cheese Pizza",
                price: "9.99",
                menu: menu)
MenuItem.create(item: "MED Cheese Pizza",
                price: "6.99",
                menu: menu)
MenuItem.create(item: "SML Cheese Pizza",
                price: "4.99",
                menu: menu)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@foodservice.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               service: true)
end
