json.extract! list, :id, :name, :position, :created_at, :updated_at, :cards
json.url list_url(list, format: :json)
