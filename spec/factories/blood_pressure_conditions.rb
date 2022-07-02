FactoryBot.define do
  factory :blood_pressure_condition do
    name { Faker::Name.unique.name }
  end
end
