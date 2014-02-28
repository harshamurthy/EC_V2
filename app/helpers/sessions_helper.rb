module SessionsHelper
  def current_sessions
    Session.todays_sessions(Date.today).select { |s| s.exercise_executions.count < s.exercises.count }
  end
end
