FactoryGirl.define do
  sequence :title do |n|
    "Challenge Title #{n}"
  end

  factory :challenge do
    user
    challenge_partner
    title { generate :title }
    description 'Test Description'
  end
end
