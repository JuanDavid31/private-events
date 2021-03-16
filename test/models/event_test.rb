require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'event name and description are valid' do
    assert_not events(:one).valid?, 'Name and description are mandatory'
  end

  test 'event description is valid' do
    assert_not events(:two).valid?, 'Description is mandatory'
  end

  test 'event name is valid' do
    assert_not events(:three).valid?, 'Name is mandatory'
  end

  test 'past scope' do
    assert_equal 2, Event.past.length, 'There should be only 2 past event'
  end

  test 'upcoming scope' do
    assert_equal 1, Event.upcoming.length, 'There should be only 1 upcoming event'
  end
end
