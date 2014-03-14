class Photo < ActiveRecord::Base
  belongs_to :client
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  scope :stats_photo, lambda { |date| where(created_at: (date.to_datetime.beginning_of_day)..(date.to_datetime.end_of_day)) }
end
