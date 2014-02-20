class Client < ActiveRecord::Base
  belongs_to :gym
  has_many :sessions
  has_many :notes
  has_many :setting_executions
  has_many :exercise_executions, through: :sessions

  def name
    self.first_name + " " + self.last_name
  end

  def get_weight_for_exercise_and_day(exercise_name, date)
    # assumes 1 exercise 1 day
    exercise = Exercise.find_by_name(exercise_name)
    # exercise.exercise_executions.where("DATE(exercise_executions.updated_at) = ?", date)
    if self.exercise_executions.where(exercise_id: exercise.id).select {|ee| ee.created_at.to_date == date}.count > 0
      self.exercise_executions.where(exercise_id: exercise.id).select {|ee| ee.created_at.to_date == date}.first.weight
      # self.exercise_executions.where(exercise_id: exercise.id).where("DATE(exercise_executions.updated_at) = ?", date)
    end
  end

  def get_previous_exercise_result(exercise_id)
    # session = self.sessions.select{|x| x.exercise_ids.include?(exercise_id)}[-2]
    # if session
    #   ee = session.exercise_executions.select{|x| x.exercise_id == exercise_id}.first
    # else
    #   return nil
    # end
    self.exercise_executions.where(exercise_id: exercise_id).last
  end
end
