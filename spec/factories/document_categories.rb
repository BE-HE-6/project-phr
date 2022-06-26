FactoryBot.define do
    factory :TbDocumentCategory do
        name { Faker::Lorem.unique.sentence }
    end
end