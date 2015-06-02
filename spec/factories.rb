FactoryGirl.define do
  factory :user do
    name "Example User"
    login "example"
    password "foobar"
    password_confirmation "foobar"
  end
end