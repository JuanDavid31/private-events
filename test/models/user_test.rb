require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user is valid' do
    user = users(:one)
    assert user.valid?, 'User should be valid'
  end

  test 'user name' do
    user = users(:two)
    assert_not user.valid?, 'Name should have more 4 or more characters'
  end

  test 'user is not valid' do
    user = users(:three)
    assert_not user.valid?, 'User should not have a name'
  end
end
