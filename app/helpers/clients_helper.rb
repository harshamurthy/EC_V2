module ClientsHelper
  # def weight_session_graph_data(client)
  #   dates = client.exercise_executions.map{ |ee| ee.session.date.to_date }.uniq
  #   (dates).map do |date|
  #     {
  #       updated_at: date,
  #       triceps: client.get_weight_for_exercise_and_day('Triceps', date, "Weight"),
  #       biceps: client.get_weight_for_exercise_and_day('Biceps', date, "Weight"),
  #       overhead_press: client.get_weight_for_exercise_and_day('Overhead Press', date, "Weight"),
  #       leg_curl: client.get_weight_for_exercise_and_day('Leg Curl', date, "Weight"),
  #       leg_press: client.get_weight_for_exercise_and_day('Leg Press', date, "Weight"),
  #       abs: client.get_weight_for_exercise_and_day('Abs', date, "Weight"),
  #       rotations: client.get_weight_for_exercise_and_day('Rotations', date, "Weight"),
  #       adduction: client.get_weight_for_exercise_and_day('Adduction', date, "Weight"),
  #       power_tower_abs: client.get_weight_for_exercise_and_day('Power Tower Abs', date, "Weight"),
  #       ab_core: client.get_weight_for_exercise_and_day('Ab Core', date, "Weight"),
  #       precore_pullover: client.get_weight_for_exercise_and_day('Precore Pull Over', date, "Weight"),
  #       narrow_grip_pulldown: client.get_weight_for_exercise_and_day('Narrow Grip Pulldown', date, "Weight"),
  #       arm_cross: client.get_weight_for_exercise_and_day('Arm Cross', date, "Weight"),
  #       leg_extension: client.get_weight_for_exercise_and_day('Leg Extension', date, "Weight"),
  #       neck_extension: client.get_weight_for_exercise_and_day('Neck Extension', date, "Weight"),
  #       lower_back: client.get_weight_for_exercise_and_day('Lower Back', date, "Weight"),
  #       rowing_torso: client.get_weight_for_exercise_and_day('Rowing Torso', date, "Weight"),
  #       abduction: client.get_weight_for_exercise_and_day('Abduction', date, "Weight") ,
  #       power_tower_leg_press: client.get_weight_for_exercise_and_day('Power Tower Leg Press', date, "Weight")
  #     }
  #   end
  # end

  # def one_weight_session_graph_data(client, exercise)
  #   dates = client.exercise_executions.map{ |ee| ee.session.date.to_date }.uniq
  #   (dates).map do |date|
  #     {
  #       updated_at: date,
  #       exercise: client.get_weight_for_exercise_and_day(exercise, date, "Weight"),
  #     }
  #   end
  # end

  def exercise_types(exercise=nil)
    if exercise.present?
      [exercise]
    else
      Exercise.all.map(&:name)
    end
  end

  def graph_by_other_y_axis(client, type, exercise=nil)
    dates = client.exercise_executions.map{ |ee| ee.session.date }.uniq
    (dates).map do |date|
      hash = {}
      hash[:updated_at] = date
      exercise_types(exercise).each do |e|
        hash[e.parameterize.underscore.to_sym] = client.get_weight_for_exercise_and_day(e, date, type)
      end
      hash
      # {
      #   updated_at: date,
      #   triceps: client.get_weight_for_exercise_and_day('Triceps', date, type),
      #   biceps: client.get_weight_for_exercise_and_day('Biceps', date, type),
      #   overhead_press: client.get_weight_for_exercise_and_day('Overhead Press', date, type),
      #   leg_curl: client.get_weight_for_exercise_and_day('Leg Curl', date, type),
      #   leg_press: client.get_weight_for_exercise_and_day('Leg Press', date, type),
      #   abs: client.get_weight_for_exercise_and_day('Abs', date, type),
      #   rotations: client.get_weight_for_exercise_and_day('Rotations', date, type),
      #   adduction: client.get_weight_for_exercise_and_day('Adduction', date, type),
      #   power_tower_abs: client.get_weight_for_exercise_and_day('Power Tower Abs', date, type),
      #   ab_core: client.get_weight_for_exercise_and_day('Ab Core', date, type),
      #   precore_pullover: client.get_weight_for_exercise_and_day('Precore Pull Over', date, type),
      #   narrow_grip_pulldown: client.get_weight_for_exercise_and_day('Narrow Grip Pulldown', date, type),
      #   arm_cross: client.get_weight_for_exercise_and_day('Arm Cross', date, type),
      #   leg_extension: client.get_weight_for_exercise_and_day('Leg Extension', date, type),
      #   neck_extension: client.get_weight_for_exercise_and_day('Neck Extension', date, type),
      #   lower_back: client.get_weight_for_exercise_and_day('Lower Back', date, type),
      #   rowing_torso: client.get_weight_for_exercise_and_day('Rowing Torso', date, type),
      #   abduction: client.get_weight_for_exercise_and_day('Abduction', date, type) ,
      #   power_tower_leg_press: client.get_weight_for_exercise_and_day('Power Tower Leg Press', date, type)
      # }
    end
  end

  # def graph_by_other_y_and_exercise(client, exercise, type)
  #   dates = client.exercise_executions.map{ |ee| ee.session.date.to_date }.uniq
  #   (dates).map do |date|
  #     {
  #       updated_at: date,
  #       exercise: client.get_weight_for_exercise_and_day(exercise, date, type),
  #     }
  #   end
  # end
end
