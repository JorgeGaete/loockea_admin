namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Admin.create!(name:     "Example User",
                  email:    "example@example.org",
                  password: "foobar",
                  password_confirmation: "foobar",
                  super_admin: true)

    77.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password = "password"
      Admin.create!(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end
  end
end