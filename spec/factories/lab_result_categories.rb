FactoryBot.define do
    factory :TbLabResultCategory do
        name { Faker::Lorem.unique.word }
    end
end