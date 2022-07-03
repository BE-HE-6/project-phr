module TokenHelper
  def authorize!
    post '/api/sign_in', params: {
      email: "user100@gmail.com",
      password: "Examples1000#"
    }
    put read_token = JSON.parse(response.body)["token"]
    request.headers['Authorization'] = "Bearer #{read_token}"
  end
end

RSpec.configure do |c|
  c.include TokenHelper
end
