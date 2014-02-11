module ClientsHelper
  def session_graph_data(client)
    (4.weeks.ago.to_date..Date.today).map do |date|
      {
        updated_at: date,
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date),
        triceps: client.get_weight_for_exercise_and_day('triceps', date)
      }
    end
  end
end
