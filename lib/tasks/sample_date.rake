namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    User.create!(name: "admin", login: "admin", password: "foobar", password_confirmation: "foobar", role: "admin")

    99.times do |n|
      name  = Faker::Name.name
      login = "pupil-#{n+1}"
      password  = "password"
      role = "pupil"
      User.create!(name: name, login: login, password: password, password_confirmation: password, role: role)
    end

    30.times do |n|
      name  = Faker::Name.name
      login = "teacher-#{n+1}"
      password  = "password"
      role = "teacher"
      User.create!(name: name, login: login, password: password, password_confirmation: password, role: role)
    end

  end
end
