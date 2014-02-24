class Exercise < ActiveRecord::Base
  has_many :exercise_executions
  has_many :setting_executions
  has_and_belongs_to_many :routines
  has_and_belongs_to_many :gyms

  validates_uniqueness_of :name

  def settings?
    array = []
    array << self.seat
    array << self.foot
    array << self.degrees
    array << self.back
    array << self.foot_stool
    array << self.pin
    array << self.arm
    array << self.seatbelt
    array << self.backpad
    array << self.knee
    array << self.seatpad
    array << self.chestpad
    array << self.hips
    array << self.leg
    if array.include?(true)
      return true
    else
      return nil
    end
  end
end
