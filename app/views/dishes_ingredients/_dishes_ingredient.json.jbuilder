json.extract! dishes_ingredient, :id, :dish_id, :ingredient_id, :created_at, :updated_at
json.url dishes_ingredient_url(dishes_ingredient, format: :json)
