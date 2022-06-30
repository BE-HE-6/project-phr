FactoryBot.define do
    factory :tb_blood_oxygen_condition do
        name { Faker::Lorem.unique.word }
    end
end