FactoryBot.define do
  factory :body_weight_height do
    user_id { 1 }
    weight { 1.5 }
    height { 1.5 }
    note { "MyText" }
    bmi_calculation { 1.5 }
    date_time { "2022-06-22 13:50:19" }
  end
end
