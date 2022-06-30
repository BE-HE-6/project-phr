FactoryBot.define do
    factory :tb_blood_glucose_condition do
        name { Faker::Lorem.unique.word }
    end
end