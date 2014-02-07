class SettingExecution < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :client
end
