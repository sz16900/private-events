class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def upcoming_events
    attended_events.where('date > date(\'now\')')
  end

  def previous_events
    attended_events.where('date < date(\'now\')')
  end
end
