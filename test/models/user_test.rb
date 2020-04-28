require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com')
    @event = Event.new(title: 'Awesome party ya\'ll',
                       description: 'Gonna be lit',
                       date: '04-20-2020',
                       place: 'Kenya',
                       creator_id: @user.id)
  end

  test 'name should not be empty' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email should not be empty' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'email should be unique' do
    @user.save
    duplicate_user = User.create(name: 'Example User', email: 'user@example.com')
    assert_not duplicate_user.valid?
  end

  test 'created event association should exist' do
    @user.save
    assert_difference '@user.events.count', 1 do
      @event.creator_id = @user.id
      @event.save
    end
  end

  test 'attended events association should exist' do
    @user.save
    @event.creator_id = @user.id
    @event.save
    assert Invitation.create(attendee_id: @user.id, attended_event_id: @event.id)
  end
end
