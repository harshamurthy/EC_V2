class Routine < ActiveRecord::Base
  has_and_belongs_to_many :exercises
  has_many :sessions
  belongs_to :gym

  validates_presence_of :description
  validates_presence_of :exercise_ids

  def self.find_or_initialize_by_exercise_ids(exercise_ids)
    exercise_ids.map! { |id| id.to_i }
    Routine.all.select{|r| r.exercise_ids == exercise_ids}.first || Routine.new(exercise_ids: exercise_ids)
    # Routine.joins(:exercises).where(:exercises_routines => { :exercise_id => exercise_ids }) || Routine.new(exercise_ids: exercise_ids)
  end
end
