class Session < ActiveRecord::Base
  has_many :exercise_executions
  has_many :setting_executions
  has_many :exercises, through: :routine
  belongs_to :routine
  belongs_to :client
end
