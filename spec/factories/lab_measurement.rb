FactoryBot.define do
    factory :TbLabMeasurement do
        name { Faker::Lorem.unique.word }
    end
end