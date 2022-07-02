FactoryBot.define do
  factory :body_weight_height do
    user_id { Faker::Number.between(from: 1, to: 4) }
    weight { Faker::Number.decimal(l_digits: 2) }
    height { Faker::Number.decimal(l_digits: 2) }
    note { Faker::Lorem.sentence(word_count: 3) }
    bmi_calculation { Faker::Number.decimal(l_digits: 2) }
    date_time { "2022-06-22 13:50:19" }
  end
end
