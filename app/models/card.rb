class Card < ActiveRecord::Base
  belongs_to :client
  has_many :sessions

  def finished_sessions
    self.sessions.where(done: true)
  end

  def next_session(session_tag)
    self.sessions.where(session_tag: session_tag).where(done: nil).first
  end

  def started?
    self.sessions.where(done: true).any?
  end
end
