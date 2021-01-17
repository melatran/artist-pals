require 'rails_helper'

describe "Search results pertaining to merchants" do
  scenario "User can get search for a shop that matches their search" do
    create(:merchant, name: "Muriel's Stickers" )
    create(:merchant, name: "Stickers and Stationary")
    create(:merchant, name: "Chandler's Stationary")

    get "/api/v1/merchants/find?name=muriel's stickers"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:attributes][:name]).to eq("Muriel's Stickers")
  end

  scenario "User can get multiple results that matches a keyword" do
    create(:merchant, name: "Muriel's Stickers" )
    create(:merchant, name: "Stickers and Stationary")
    create(:merchant, name: "Chandler's Stationary")

    get "/api/v1/merchants/find_all?name=stationary"

    json = JSON.parse(response.body, symbolize_names: true)

    names = json[:data].map do |merchant|
      merchant[:attributes][:name]
    end

    expect(response).to be_successful
    expect(json[:data].length).to eq(2)
    expect(json[:data].length).to_not eq(3)
    expect(names.sort).to eq(["Chandler's Stationary", "Stickers and Stationary"])
    expect(names).to_not include("Muriel's Stickers")
  end
end