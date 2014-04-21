class Card < ActiveRecord::Base
  belongs_to :client
  has_many :sessions

  def finished_sessions
    self.sessions.where(done: true)
  end

  def next_session(session_tag)
    self.sessions.where(session_tag: session_tag, done: nil).first
  end

  def started?
    self.sessions.where(done: true).any?
  end

  def stagger
    a_routines = self.sessions.where(session_tag: "A")
    b_routines = self.sessions.where(session_tag: "B")
    c_routines = self.sessions.where(session_tag: "C")

    arr = [a_routines] + [b_routines] + [c_routines]

    first, *rest = *arr;
    return first.zip(*rest).flatten.compact
  end
end
