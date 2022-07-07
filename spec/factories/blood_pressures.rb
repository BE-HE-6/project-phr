FactoryBot.define do
  factory :blood_pressure do
    user_id { 1 }
    blood_pressure_condition_id { Faker::Number.between(from: 1, to: 4) }
    sistole { Faker::Number.within(range: 1..180) }
    diastole { Faker::Number.within(range: 1..120) }
    pulse { Faker::Number.within(range: 30..120) }
    note { Faker::Lorem.sentence(word_count: 3) }
    date_time { "2022-06-29 17:26:45" }
  end
end
