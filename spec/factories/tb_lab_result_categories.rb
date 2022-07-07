FactoryBot.define do
  factory :tb_lab_result_category do
    name { Faker::Lorem.unique.sentence }
  end
end
