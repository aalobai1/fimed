FactoryBot.define do
  factory :patient do
    given_name { Faker::Lorem.word }
    family_name { Faker::Lorem.word }
    race { 'white' }
    gender { 'female' }
  end
end
