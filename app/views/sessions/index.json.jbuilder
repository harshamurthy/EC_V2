json.array!(@sessions) do |session|
  json.extract! session, :id, :name, :date, :client_id
  json.url session_url(session, format: :json)
end
