FactoryBot.define do
    factory :TbDocument do
        doc_name { Faker::Lorem.unique.word }
        doc_upload { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))) }
        user_id { Faker::Number.between(from: 1, to: 5) }
        document_category_id { Faker::Number.between(from: 1, to: 5) }
    end
end