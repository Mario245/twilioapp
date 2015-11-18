json.array!(@sms) do |sm|
  json.extract! sm, :id, :to, :from, :body
  json.url sm_url(sm, format: :json)
end
