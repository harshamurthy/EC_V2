class Client < ActiveRecord::Base
  belongs_to :gym
  has_many :sessions
  has_many :notes
  has_many :setting_executions
  has_many :client_stats

  has_many :photos

  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :client_stats

  has_many :exercise_executions, through: :sessions
  has_attached_file :avatar,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => ENV["S3_BUCKET_NAME"], :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]}
  end

  def name
    self.first_name + " " + self.last_name
  end

  def get_weight_for_exercise_and_day(exercise_name, date, type)
    # assumes 1 exercise 1 day
    exercise = Exercise.find_by_name(exercise_name)
    executions = self.exercise_executions.for_exercise(exercise.id).for_date(date)

    case type
    when "Weight"
      executions.first.weight if executions.count > 0
    when "Percentage"
      executions.first.percentage if executions.count > 0
    when "Reps"
      executions.first.reps if executions.count > 0
    when "Time"
      executions.first.time if executions.count > 0
    end

  end

  def get_previous_exercise_result(exercise_id)
    self.exercise_executions.where(exercise_id: exercise_id).last
  end

  def has_current_session?

  end
end
