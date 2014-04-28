json.array!(@quote_posts) do |quote_post|
  json.extract! quote_post, :id, :quote, :author
  json.url quote_post_url(quote_post, format: :json)
end
