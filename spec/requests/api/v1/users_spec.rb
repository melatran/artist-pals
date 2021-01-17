require 'rails_helper'

describe "Users Api" do
  it 'can create a new user' do
    user_params = { 'email': 'email@gmail.com',
      'password': 'password',
      'password_confirmation': 'password' }

    post '/api/v1/users', params: user_params
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data][:attributes].keys).to_not eq([:id, :email, :api_key, :password])
    expect(json[:data][:attributes].keys).to eq([:id, :email, :api_key])
    expect(json[:data][:attributes][:email]).to eq('email@gmail.com')
    expect(json[:data][:attributes][:api_key]).to_not be_nil
  end

  it 'cannot create a new user when fields are not filled in' do
    user_params = { 'email': '',
      'password': 'password',
      'password_confirmation': 'password' }

    post '/api/v1/users', params: user_params

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(json[:errors]).to eq(["Email can't be blank"])
  end

  it 'cannot register with the same email twice' do
    user_params = { 'email': 'email@gmail.com',
      'password': 'password',
      'password_confirmation': 'password' }

    post '/api/v1/users', params: user_params
    post '/api/v1/users', params: user_params

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(json[:errors]).to eq(["Email has already been taken"])
  end

  it 'cannot register if passwords do not match' do
    user_params = { 'email': 'email@gmail.com',
      'password': 'password',
      'password_confirmation': '1234' }

    post '/api/v1/users', params: user_params

    json = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(json[:errors]).to eq(["Password confirmation doesn't match Password"])
  end
end