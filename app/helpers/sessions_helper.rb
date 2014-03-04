module SessionsHelper
  def current_sessions
    current_gym.sessions.todays_sessions(Date.today).select { |s| s.exercise_executions.count < s.exercises.count }
  end
end
