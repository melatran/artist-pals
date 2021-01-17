require 'rails_helper'

describe "Merchants API" do
  it "can send a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
    merchants = JSON.parse(response.body)
    expect(merchants["data"].length).to eq(3)
  end

  it "can get one merchant by id" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    merchant_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant_json[:data][:id]).to eq(merchant.id.to_s)
    expect(merchant_json[:data][:attributes][:name]).to eq(merchant.name)
  end
end