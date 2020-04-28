require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com')
    @event = Event.new(title: 'Awesome party ya\'ll',
                       description: 'Gonna be lit',
                       date: '04-20-2020',
                       place: 'Kenya',
                       creator_id: @user.id)
  end

  test 'association creator_id exist' do
    @user.save
    @event.creator_id = @user.id
    @event.save
    assert_not @event.creator_id.nil?
  end

  test 'association invitation exist' do
    @user.save
    @event.creator_id = @user.id
    @event.save
    assert_not @event.attendees.nil?
  end
end
