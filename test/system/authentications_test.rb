require 'application_system_test_case'

class AuthenticationsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit root_url

    assert_selector 'h1', text: 'Users'
  end

  test 'Sign up' do
    visit '/sign_up'

    user_name = "Juan#{rand(1..1000)}"

    fill_in 'user_name', with: user_name
    click_on 'Create User'
    assert_text 'User was successfully created.'
    click_on 'Sign Out'
    assert_text 'Sign out succesfully'
  end

  test 'Sign out' do
    visit '/sign_in'

    fill_in 'name', with: 'Juan'
    click_button(value: 'Sign In')
    click_on 'Sign Out'
    assert_text 'Sign out succesfully'
  end

end
