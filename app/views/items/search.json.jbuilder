json.array! @items do |item|
  json.id item.id
  json.image item.image
  json.name item.name
  json.price item.price
end