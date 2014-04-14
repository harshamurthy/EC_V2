class Card < ActiveRecord::Base
  belongs_to :client
  has_many :sessions
end
