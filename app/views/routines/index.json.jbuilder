json.array!(@routines) do |routine|
  json.extract! routine, :id, :description, :gym_id
  json.url routine_url(routine, format: :json)
end
