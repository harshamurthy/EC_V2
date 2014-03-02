class Gym < ActiveRecord::Base
  has_many :clients
  has_many :routines
  has_and_belongs_to_many :exercises
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def sessions
    array = []
    self.clients.each do |c|
      c.sessions.each do |s|
        array << s
      end
    end
    return array
  end
end
