json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :weight, :percentage, :reps, :time, :seat, :foot, :degrees, :back
  json.url exercise_url(exercise, format: :json)
end
