class Gym < ActiveRecord::Base
  has_many :clients
  has_many :routines
  has_many :sessions, through: :clients
  has_and_belongs_to_many :exercises
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
