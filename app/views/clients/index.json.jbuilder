json.array!(@clients) do |client|
  json.extract! client, :id, :gym_id, :first_name, :last_name, :email, :machine_code
  json.url client_url(client, format: :json)
end
