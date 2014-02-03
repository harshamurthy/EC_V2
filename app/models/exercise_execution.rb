class ExerciseExecution < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :session
end
