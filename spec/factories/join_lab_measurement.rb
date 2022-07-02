FactoryBot.define do
    factory :TbJoinLabMeasurement do
        lab_measurement_id { Faker::Number.between(from: 1, to: 5) }
        lab_result_id { Faker::Number.between(from: 1, to: 5) }
        lab_result_tb_user_id { Faker::Number.between(from: 1, to: 5) }
        lab_result_tb_lab_result_category_id { Faker::Number.between(from: 1, to: 5) }
        value { Faker::Lorem.sentence }
    end
end