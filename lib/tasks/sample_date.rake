namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    @admin = User.new(name: "admin", login: "admin", password: "foobar", password_confirmation: "foobar", role: "admin")
    @admin.save!(:validate => false)

    99.times do |n|
      name  = Faker::Name.name
      login = "example-#{n+1}"
      password  = "password"
      mother_name = Faker::Name.name
      mother_telephone = Faker::PhoneNumber.cell_phone
      father_name = Faker::Name.name
      father_telephone = Faker::PhoneNumber.phone_number
      User.create!(name: name, login: login, password: password, password_confirmation: password, role: "pupil",
                   mother_telephone: mother_telephone, mother_name: mother_name, father_name: father_name, father_telephone: father_telephone)
    end


  end
end
