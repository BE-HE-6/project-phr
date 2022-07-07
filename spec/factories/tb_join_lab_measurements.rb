FactoryBot.define do
  factory :tb_join_lab_measurement do
    result_id { Faker::Number.between(from: 1, to: 5) }
    measurement_id { Faker::Number.between(from: 1, to: 5) }
    value { Faker::Lorem.sentence }
  end
end
