FactoryGirl.define do
  factory :user do
    username 'john'
    first_name 'John'
    last_name 'Doe'
    email 'john@testing.tld'
    password 'testingthis'
    password_confirmation 'testingthis'
    admin false
  end
end
