User.create!(name:  "Tom Brady",
             email: "brady@patriots.com",
             password:              "tbrady",
             password_confirmation: "tbrady",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now.to_datetime)

25.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now.to_datetime)
end

25.times do |n|
  title  = Faker::Commerce.product_name
  price = Faker::Commerce.price
  release_year = 2015
  description = Faker::Company::catch_phrase
  Product.create!(title:  title,
              price: price,
              release_year: release_year,
              description: description,
              active: true)
end

OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"