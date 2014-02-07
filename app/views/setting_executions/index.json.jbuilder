json.array!(@setting_executions) do |setting_execution|
  json.extract! setting_execution, :id, :seat, :foot, :degrees, :back, :user_id, :exercise_id, :foot_stool, :pin, :arm, :seatbelt, :backpad, :knee, :seatpad, :chestpad, :hips, :leg
  json.url setting_execution_url(setting_execution, format: :json)
end
