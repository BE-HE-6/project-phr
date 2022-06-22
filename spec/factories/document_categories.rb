FactoryBot.define do
    factory :TbDocumentCategory do
        name { Faker::Lorem.unique.word }
    end
end