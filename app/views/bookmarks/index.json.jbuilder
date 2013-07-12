json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :title, :url, :card_id
  json.url bookmark_url(bookmark, format: :json)
end
