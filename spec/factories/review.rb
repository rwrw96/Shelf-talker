FactoryBot.define do 
  factory :review do
    title { Faker::Lorem.characters(number:50)}
    body { Faker::Lorem.characters(number:200)}
    rate {5.0}
    association :user
  end
  factory :user do
    name { Faker::Lorem.characters(number:20)}
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number:6)}
  end
end


