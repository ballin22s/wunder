User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now.to_datetime)

99.times do |n|
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

99.times do |n|
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