module ClientsHelper
  def weight_session_graph_data(client)
    dates = client.exercise_executions.map{ |ee| ee.session.date.to_date }.uniq
    (dates).map do |date|
      {
        updated_at: date,
        triceps: client.get_weight_for_exercise_and_day('Triceps', date),
        biceps: client.get_weight_for_exercise_and_day('Biceps', date),
        overhead_press: client.get_weight_for_exercise_and_day('Overhead Press', date),
        leg_curl: client.get_weight_for_exercise_and_day('Leg Curl', date),
        leg_press: client.get_weight_for_exercise_and_day('Leg Press', date),
        abs: client.get_weight_for_exercise_and_day('Abs', date),
        rotations: client.get_weight_for_exercise_and_day('Rotations', date),
        adduction: client.get_weight_for_exercise_and_day('Adduction', date),
        power_tower_abs: client.get_weight_for_exercise_and_day('Power Tower Abs', date),
        ab_core: client.get_weight_for_exercise_and_day('Ab Core', date),
        precore_pullover: client.get_weight_for_exercise_and_day('Precore Pull Over', date),
        narrow_grip_pulldown: client.get_weight_for_exercise_and_day('Narrow Grip Pulldown', date),
        arm_cross: client.get_weight_for_exercise_and_day('Arm Cross', date),
        leg_extension: client.get_weight_for_exercise_and_day('Leg Extension', date),
        neck_extension: client.get_weight_for_exercise_and_day('Neck Extension', date),
        lower_back: client.get_weight_for_exercise_and_day('Lower Back', date),
        rowing_torso: client.get_weight_for_exercise_and_day('Rowing Torso', date),
        abduction: client.get_weight_for_exercise_and_day('Abduction', date),
        power_tower_leg_press: client.get_weight_for_exercise_and_day('Power Tower Leg Press', date)
      }
    end
  end
end
