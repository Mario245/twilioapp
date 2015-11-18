json.array!(@smsmsgs) do |smsmsg|
  json.extract! smsmsg, :id, :to, :from, :message
  json.url smsmsg_url(smsmsg, format: :json)
end
