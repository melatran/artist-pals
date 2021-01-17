require 'rails_helper'

describe "Item Search Results" do
  scenario "User can get multiple results for name back" do
    create(:item, name: "Super Snax" )
    create(:item, name: "Super Junior Lightstick")
    create(:item, name: "GOT7 Lightstick")
    create(:item, name: "Shin Ramen" )
    create(:item, name: "EXO Lightstick")

    get "/api/v1/items/find_all?name=lightstick"

    json = JSON.parse(response.body, symbolize_names: true)

    names = json[:data].map do |item|
      item[:attributes][:name]
    end

    expect(response).to be_successful
    expect(json[:data].count).to eq(3)
    expect(json[:data].length).to_not eq(5)
    expect(names).to_not include("Shin Ramen")
    expect(names).to_not include("Super Snax")
    expect(names.sort).to eq(["EXO Lightstick", "GOT7 Lightstick", "Super Junior Lightstick"])
  end

  scenario "User can get multiple results for created at" do
    create(:item, created_at: "2019-03-18 12:00:30 UTC")
    create(:item, created_at: "2019-03-18 12:00:30 UTC")
    create(:item, created_at: "2019-11-18 12:00:30 UTC")

    get "/api/v1/items/find_all?created_at=2019-03-18"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data].count).to eq(2)
    expect(json[:data].count).to_not eq(3)
  end
end