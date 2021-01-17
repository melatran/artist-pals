require 'rails_helper'

describe "Items Api" do
  it "can send a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)
    expect(items[:data].count).to eq(3)
  end
  
  it "can get one item by the id" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data][:id]).to eq(item.id.to_s)
    expect(json[:data][:attributes][:name]).to eq(item.name)
    expect(json[:data][:attributes][:description]).to eq(item.description)
    expect(json[:data][:attributes][:unit_price]).to eq(item.unit_price)
  end

  it 'can create new items' do
    merchant = create(:merchant)
    item_params = {
              name: 'Lee Min Ho Cardboard Cutout',
              description: 'Your pretend boyfriend',
              photo: 'http/image.png',
              unit_price: 21.00,
              merchant_id: merchant.id}

    post '/api/v1/items', params: item_params

    JSON.parse(response.body, symbolize_names: true)
    item = Item.last

    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
    expect(item.description).to eq(item_params[:description])
    expect(item.unit_price).to eq(item_params[:unit_price])
    expect(item.photo).to eq(item_params[:photo])
    expect(item.merchant_id).to eq(item_params[:merchant_id])
  end

  it 'can update an item' do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    previous = Item.last.name
    item_params = {name: 'Mini Fan'}

    patch "/api/v1/items/#{item.id}", params: item_params

    item_object = Item.find_by(id: item.id)

    expect(response).to be_successful
    expect(item_object.name).to_not eq(previous)
    expect(item_object.name).to eq('Mini Fan')
  end
end