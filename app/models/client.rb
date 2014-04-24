class Client < ActiveRecord::Base
  belongs_to :gym
  has_many :sessions
  has_many :notes
  has_many :setting_executions
  has_many :client_stats
  has_many :goals
  has_many :cards

  has_many :photos

  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :client_stats
  accepts_nested_attributes_for :goals

  has_many :exercise_executions, through: :sessions

  # TODO: Using StorageConfiguration most of the settings stays in one place but you can still customize it
  # TIP: I usually prefer # instead of > for image styles, with > imagemagick shrink the image if it's bigger
  # than the given values distorting the image but with # it tries to shrink but it keeps the aspect ratio cutting
  # the edges if necessary.

  # has_attached_file :avatar,
  #                   :styles => { :medium => "300x300>", :thumb => "100x100>" },
  #                   :default_style => :thumb,
  #                   :default_url => '/images/default_profile_pic.jpg',
  #                   :storage => :s3,
  #                   :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
  #                   :s3_host_name   => "s3-eu-west-2.amazonaws.com"

  # def s3_credentials
  #   {:bucket => ENV["S3_BUCKET_NAME"], :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]}
  # end

  has_attached_file :avatar, StorageConfiguration.for_attachments.merge(
    styles: { thumb: "300x300#", tiny: '100x100#' },
    default_url: '/images/default_profile_pic.jpg'
  )

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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

def next_session_tag
  current_card = self.cards.last if self.cards.any?
  if current_card && current_card.sessions.count > 8
    if current_card.sessions.where(done: true).any? && current_card.sessions.where(done: true).order('sessions.finished_at ASC').last.session_tag == 'A'
      return 'B'
    elsif current_card.sessions.where(done: true).any? && current_card.sessions.where(done: true).order('sessions.finished_at ASC').last.session_tag == 'B'
      if current_card.sessions.where(session_tag: 'C').any?
        return 'C'
      else
        return 'A'
      end
    else
      return 'A'
    end
    else
      return 'A'
    end
  end

  def next_session
    if self.cards.any?
      current_card = self.cards.last
      next_session = current_card.next_session(self.next_session_tag)
      return next_session
    else
      return nil
    end
  end








end
