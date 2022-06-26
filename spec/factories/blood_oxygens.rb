FactoryBot.define do
    factory :tb_blood_oxygen, class: TbBloodOxygen do
        blood_oxygen { Faker::Number.between(from: 50, to: 100) }
        note { Faker::Lorem.sentence }
        date_time { Time.now }
        user_id { Faker::Number.between(from: 1, to: 5) }
        blood_oxygen_condition_id { Faker::Number.between(from: 3, to: 6) }
    end
end