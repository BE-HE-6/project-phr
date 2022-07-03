FactoryBot.define do
    factory :TbVaccineCategory do
        name { Faker::Lorem.unique.word }
    end
end