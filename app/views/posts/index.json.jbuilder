json.array!(@posts) do |post|
  json.extract! post, :id, :to, :from, :body
  json.url post_url(post, format: :json)
end
