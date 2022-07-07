module TokenHelper
  def authorizeAdmin
    post '/api/sign_up', params: {
      user: {
        email: "admin@examples.com",
        password: "Examples20#",
        name: "admin",
        role: 'admin',
        birth_place: "Jakarta",
        birth_date: "2022-10-10",
        blood_type: "B",
        bpjs_id: "00127295921",
        ktp_id: "3673033607930003"
      }
    }

    post '/api/sign_in', params: {
      email: "admin@examples.com",
      password: "Examples20#"
    }
    read_token = JSON.parse(response.body)["token"]
  end
  def authorizeUser(email, password)
    post '/api/sign_in', params: {
      email: email,
      password: password
    }
    read_token = JSON.parse(response.body)["token"]
  end
end

RSpec.configure do |c|
  c.include TokenHelper
end
