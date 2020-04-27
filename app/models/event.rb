class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :invitations, foreign_key: :attended_event_id
    has_many :attendees, through: :invitations

    def self.past
        Event.where('date < date(\'now\')')
    end

    def self.upcoming
        Event.where('date > date(\'now\')')
    end

end
