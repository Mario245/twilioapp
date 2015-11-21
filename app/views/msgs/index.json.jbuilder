json.array!(@msgs) do |msg|
  json.extract! msg, :id, :to, :from, :body
  json.url msg_url(msg, format: :json)
end
