json.array!(@tenants) do |tenant|
  json.extract! tenant, :id, :to, :from, :message
  json.url tenant_url(tenant, format: :json)
end
