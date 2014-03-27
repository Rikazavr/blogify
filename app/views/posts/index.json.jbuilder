json.array!(@posts) do |post|
  json.extract! post, :id, :title, :image, :data, :text
  json.url post_url(post, format: :json)
end
