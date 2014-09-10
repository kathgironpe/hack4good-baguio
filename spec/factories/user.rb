FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :username do |n|
    "username#{n}"
  end

  factory :user do
    username { generate :username }
    first_name 'John'
    last_name 'Doe'
    email { generate :email }
    password 'testingthis'
    password_confirmation 'testingthis'
    admin false
  end

  factory :admin, parent: :user do
    admin true
  end
end
