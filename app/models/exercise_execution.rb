class ExerciseExecution < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :session

  scope :for_exercise, lambda { |exercise_id| where(exercise_id: exercise_id) }
  scope :for_date, lambda { |date| where(created_at: (date.to_datetime.beginning_of_day)..(date.to_datetime.end_of_day)) }
end
