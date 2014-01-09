json.array!(@stocks) do |stock|
  json.extract! stock, :id, :food_id, :price, :quantity, :store_id, :discount, :bought, :user_id
  json.url stock_url(stock, format: :json)
end
