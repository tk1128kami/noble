json.array! @customers do |customer|
  json.id customer.id
  json.name customer.name
  json.name_kana customer.name_kana
  json.nickname customer.nickname
  json.birthday customer.birthday
  json.phone customer.phone
  json.email customer.email
  json.text customer.text
  json.items customer.items do |item|
    json.name item.name
    json.price item.name
    json.image item.image
    json.text item.text
  end
end