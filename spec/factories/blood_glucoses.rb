FactoryBot.define do
    factory :tb_blood_glucose, class: TbBloodGlucose do
        blood_glucose { Faker::Number.between(from: 50, to: 100) }
        note { Faker::Lorem.sentence }
        date_time { Time.now }
        user_id { 1 }
        blood_glucose_condition_id { Faker::Number.between(from: 1, to: 3) }
    end
end
