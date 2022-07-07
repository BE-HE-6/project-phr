FactoryBot.define do
  factory :tb_lab_result do
    name { Faker::Lorem.sentence }
    doc { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/untitled.png'))) }
    user_id { 1 }
    result_category_id { Faker::Number.between(from: 1, to: 5) }
    result_note { Faker::Lorem.sentence }
    date_time { "2022-06-22 13:50:19" }
  end
end
