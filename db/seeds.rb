user = User.create(name:  "Example User",
                   email: "example@email.com",
                   password: "examplepass",
                   service: true,
                   admin: false)

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
