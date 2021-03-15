require 'application_system_test_case'

class EventsManagementsTest < ApplicationSystemTestCase
  test 'Create event' do
    sign_in

    visit new_event_path
    fill_in 'event_name', with: 'Very cool event'
    fill_in 'event_description', with: 'Very cool description'
    click_on 'Create Event'
    assert_text 'Event was successfully created.'
  end

  test 'invite people to event' do
    sign_in

    visit event_path id: 1
    click_on 'Invite'
    assert_no_link 'Invite'
  end

  private

  def sign_in
    visit '/sign_in'
    fill_in 'name', with: 'Juan'
    click_button(value: 'Sign In')
  end
end
