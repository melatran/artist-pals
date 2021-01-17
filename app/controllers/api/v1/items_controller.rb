class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: ItemSerializer.new(items)
  end

  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item)
  end

  def create
    render json: ItemSerializer.new(Item.create(item_params))
  end

  private

  def item_params
    params.permit(:name, :description, :photo, :unit_price, :merchant_id)
  end
end