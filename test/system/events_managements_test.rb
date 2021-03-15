require "application_system_test_case"

class EventsManagementsTest < ApplicationSystemTestCase
  test 'Create event' do
    # sign up
    visit '/sign_in'
    fill_in 'name', with: 'Juan'
    click_button(value: 'Sign In')

    visit new_event_path
    fill_in 'event_name', with: 'Very cool event'
    fill_in 'event_description', with: 'Very cool description'
    click_on 'Create Event'
    assert_text 'Event was successfully created.'
  end

  test 'invite people to event' do

  end
end
