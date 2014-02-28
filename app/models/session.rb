class Session < ActiveRecord::Base
  has_many :exercise_executions
  has_many :setting_executions
  has_many :exercises, through: :routine
  belongs_to :routine
  belongs_to :client

  def done?
    self.exercise_executions.count == self.exercises.count
  end

  scope :todays_sessions, lambda { |date| where(created_at: (date.to_datetime.beginning_of_day)..(date.to_datetime.end_of_day)) }
end
