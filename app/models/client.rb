class Client < ActiveRecord::Base
  belongs_to :gym
  has_many :sessions

  def name
    self.first_name + " " + self.last_name
  end
end
