class Exercise < ActiveRecord::Base
  has_many :exercise_executions
  has_and_belongs_to_many :routines
end
