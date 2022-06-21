FactoryBot.define do
    factory :TbVaccine do
        user_id { Faker::Number.between(from: 1, to: 5) }
        vaccine_category_id { Faker::Number.between(from: 1, to: 5) }
        name { Faker::Lorem.sentence }
        location { Faker::Address.city }
    end
end