FactoryBot.define do
  factory :blood_pressure do
    user_id { 1 }
    blood_pressure_condition_id { 1 }
    sistole { 1 }
    diastole { 1 }
    pulse { 1 }
    note { "MyText" }
    date_time { "2022-06-29 17:26:45" }
  end
end
