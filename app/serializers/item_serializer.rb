class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :photo, :unit_price, :merchant_id
end