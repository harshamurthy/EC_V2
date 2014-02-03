class Routine < ActiveRecord::Base
  has_and_belongs_to_many :exercises
  has_many :sessions
  belongs_to :gym

  validates :description, presence: true
  validate :uniqueness_of_exercises

  def uniqueness_of_exercises
    if Routine.all.collect{|r| r.exercise_ids}.include?(exercise_ids)
      errors.add :base, 'a routine with thoses exercises already exists.'
    end
  end

  def self.find_or_initialize_by_exercise_ids(exercise_ids)
    Routine.all.select{|r| r == exercise_ids}.first || Routine.new(exercise_ids: exercise_ids)
  end
end
