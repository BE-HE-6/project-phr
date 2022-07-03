FactoryBot.define do
    factory :TbVaccineCategory do
        name { Faker::Lorem.unique.sentence }
    end
end