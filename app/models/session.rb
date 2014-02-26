class Session < ActiveRecord::Base
  has_many :exercise_executions
  has_many :setting_executions
  has_many :exercises, through: :routine
  belongs_to :routine
  belongs_to :client

  def done?
    self.exercise_executions.count == self.exercises.count
  end
end
