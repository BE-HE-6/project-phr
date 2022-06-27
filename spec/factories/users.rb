FactoryBot.define do
  factory :user do
    role { 0 }
    email { Faker::Internet.email }
    password_digest { "Examples20#" }
    name { "Mohammad Yusuf" }
    birth_place { "Jakarta" }
    birth_date { "2022-10-15" }
    blood_type { "AB" }
    bpjs_id { "00127295921" }
    ktp_id { "3673033607930003" }

    factory :admin do
      role { 1 }
    end
  end

  factory :invalid_user, parent: :user do
    role { 0 }
    email { nil }
    password_digest { nil }
    name { nil }
    birth_place { nil }
    birth_date { nil }
    blood_type { nil }
    bpjs_id { nil }
    ktp_id { nil }

    factory :invalid_admin, parent: :admin do
      role { 1 }
    end
  end
end
