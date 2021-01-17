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
end