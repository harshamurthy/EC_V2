class Client < ActiveRecord::Base
  belongs_to :gym
  has_many :sessions
  has_many :setting_executions
  has_many :exercise_executions, through: :sessions

  def name
    self.first_name + " " + self.last_name
  end

  def get_weight_for_exercise_and_day(exercise_name, date)
    # assumes 1 exercise 1 day
    exercise = Exercise.find_by_name(exercise_name)
    # exercise.exercise_executions.where("DATE(exercise_executions.updated_at) = ?", date)
    if self.exercise_executions.where(exercise_id: exercise.id).select{|ee| ee.updated_at.to_date == date}.count > 0
      self.exercise_executions.where(exercise_id: exercise.id).select{|ee| ee.updated_at.to_date == date}.first.weight
      # self.exercise_executions.where(exercise_id: exercise.id).where("DATE(exercise_executions.updated_at) = ?", date)
    end
  end
end
