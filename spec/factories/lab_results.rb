FactoryBot.define do
    factory :TbLabResult do
        user_id { Faker::Number.between(from: 1, to: 5) }
        lab_result_category_id { Faker::Number.between(from: 1, to: 5) }
        lab_name { Faker::Lorem.sentence }
        lab_doc { Faker::Lorem.sentence }
        lab_result_note { Faker::Lorem.sentence}
    end
end
