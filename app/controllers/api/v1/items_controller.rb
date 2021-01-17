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
    new_item = Item.create(item_params)
    render json: ItemSerializer.new(new_item)
  end

  def update
    update_item = Item.update(params[:id], item_params)
    render json: ItemSerializer.new(update_item)
  end

  def destroy
    remove_item = Item.destroy(params[:id])
    render json: ItemSerializer.new(remove_item)
  end

  private

  def item_params
    params.permit(:name, :description, :photo, :unit_price, :merchant_id)
  end
end