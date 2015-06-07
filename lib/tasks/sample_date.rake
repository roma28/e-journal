namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    User.create!(name: "admin", login: "admin", password: "foobar", password_confirmation: "foobar")

    99.times do |n|
      name  = Faker::Name.name
      login = "example-#{n+1}"
      password  = "password"
      User.create!(name: name, login: login, password: password, password_confirmation: password)
    end


  end
end
