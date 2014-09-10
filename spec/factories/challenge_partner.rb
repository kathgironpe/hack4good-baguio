FactoryGirl.define do
  sequence :name do |n|
    "Challenge Partner Name #{n}"
  end

  factory :challenge_partner do
    name { generate :name }
    description 'Test Description'
  end
end
