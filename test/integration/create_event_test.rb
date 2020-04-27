require 'test_helper'

class CreateEventTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: 'Example User',
                        email: 'user@example.com')
  end

  test 'valid create event' do
    log_in_as(@user)
    get new_event_path
    assert_difference 'Event.count', 1 do
      post events_path, params: { event: { title: 'Awesome party ya\'ll',
                                           description: 'Gonna be lit',
                                           date: '04-20-2020',
                                           place: 'Kenya' } }
    end
  end
end
