json.extract! media_item, :id, :x, :y, :z, :item, :room_id, :created_at, :updated_at
json.url media_item_url(media_item, format: :json)
json.item url_for(media_item.item)
