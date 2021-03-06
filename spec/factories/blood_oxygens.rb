FactoryBot.define do
    factory :tb_blood_oxygen, class: TbBloodOxygen do
        blood_oxygen { Faker::Number.between(from: 50, to: 100) }
        note { Faker::Lorem.sentence }
        date_time { Time.now }
        user_id { 1 }
        blood_oxygen_condition_id { Faker::Number.between(from: 1, to: 3) }
    end
end
