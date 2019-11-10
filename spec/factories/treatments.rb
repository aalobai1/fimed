FactoryBot.define do
  factory :treatment do
    display_name { Faker::Lorem.word }
    coding { Faker::Lorem.word }
    code { Faker::Lorem.word }
    covered_by_insurance { true }
    patient_id { nil }
  end
end
