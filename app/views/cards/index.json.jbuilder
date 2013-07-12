json.array!(@cards) do |card|
  json.extract! card, :title
  json.url card_url(card, format: :json)
end
