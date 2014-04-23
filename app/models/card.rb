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
    a_routines = self.sessions.order('sessions.created_at ASC').where(session_tag: "A")
    b_routines = self.sessions.order('sessions.created_at ASC').where(session_tag: "B")
    c_routines = self.sessions.order('sessions.created_at ASC').where(session_tag: "C")

    if a_routines.length > b_routines.length && a_routines.length > c_routines.length
      arr = [a_routines] + [b_routines] + [c_routines]
    elsif b_routines.length > a_routines.length && b_routines.length > c_routines.length
      arr = [b_routines] + [a_routines] + [c_routines]
    elsif c_routines.length > a_routines.length && c_routines.length > b_routines.length
      arr = [c_routines] + [b_routines] + [a_routines]
    else
      arr = [a_routines] + [b_routines] + [c_routines]
    end

    first, *rest = *arr;
    return first.zip(*rest).flatten.compact
  end

  def stagger_finished
    a_routines = self.sessions.order('sessions.finished_at ASC').where(session_tag: "A", done: true)
    b_routines = self.sessions.order('sessions.finished_at ASC').where(session_tag: "B", done: true)
    c_routines = self.sessions.order('sessions.finished_at ASC').where(session_tag: "C", done: true)

    if a_routines.length > b_routines.length && a_routines.length > c_routines.length
      arr = [a_routines] + [b_routines] + [c_routines]
    elsif b_routines.length > a_routines.length && b_routines.length > c_routines.length
      arr = [b_routines] + [a_routines] + [c_routines]
    elsif c_routines.length > a_routines.length && c_routines.length > b_routines.length
      arr = [c_routines] + [b_routines] + [a_routines]
    else
      arr = [a_routines] + [b_routines] + [c_routines]
    end

    first, *rest = *arr;
    return first.zip(*rest).flatten.compact
  end
end
