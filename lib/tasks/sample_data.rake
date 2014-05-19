namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Admin.create!(name:     "Example User",
                  email:    "example@example.org",
                  password: "foobar",
                  password_confirmation: "foobar",
                  super_admin: true)
                  
    2.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password = "password"
      Admin.create!(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end
    
    2.times do |n|
      Campana.create!(contenido_id:      1,
                      name:           "campana_#{n+1}",
                      tipo:            1,
                      client:          "cliente_#{n+1}",
                      goal:            100,
                      status:          1
                      )                
    end
    
    campana = Campana.all(limit: 2)
    5.times do
      name = Faker::Lorem.sentence(1)
      campana.each { |campana| campana.contenidos.create!(name: name, status: 1) }
    end
  end
end

#10.times do
#  name =  Faker::Lorem.sentence(5)
#  campana.each { |campana| campana.contenidos.create!(name: name) }
#end