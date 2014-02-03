json.array!(@exercise_executions) do |exercise_execution|
  json.extract! exercise_execution, :id, :weight, :percentage, :reps, :time, :seat, :foot, :degrees, :back
  json.url exercise_execution_url(exercise_execution, format: :json)
end
