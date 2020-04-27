require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @user = User.create(name: 'Example User', email: 'user@example.com')
    @event = Event.create(title: 'Awesome party ya\'ll',
                          description: 'Gonna be lit',
                          date: '04-20-2020',
                          place: 'Kenya',
                          creator_id: @user.id)
    @invitation = Invitation.create(attendee_id: @user.id , attended_event_id: @event.id)
  end

  test "association creator_id exist" do
    assert_not @event.creator_id.nil?
  end

  test "association invitation exist" do
    assert_not @event.attendees.empty?
  end

  # test "upcoming events included in Event.upcoming scope" do
  #   assert_difference -> { Event.upcoming.count }, 1 do
  #     @upcoming_event = Event.create!(title: 'Awesome party ya\'ll',
  #                                            description: 'Gonna be lit',
  #                                            date: '06-20-2020',
  #                                            place: 'Kenya',
  #                                            creator_id: @user.id)
  #   end
  #   assert_includes Event.upcoming, @upcoming_event
  # end
end
