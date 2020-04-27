require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'Example User', email: 'user@example.com')
    @event = Event.create(title: 'Awesome party ya\'ll',
                          description: 'Gonna be lit',
                          date: '04-20-2020',
                          place: 'Kenya',
                          creator_id: @user.id)
    @invitation = Invitation.create(attendee_id: @user.id , attended_event_id: @event.id)
  end

  test "name should not be empty" do
    @user.name = ''
    assert_not @user.valid?
  end

  test "email should not be empty" do
    @user.email = ''
    assert_not @user.valid?
  end
end
