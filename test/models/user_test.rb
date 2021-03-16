require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user is valid' do
    user = users(:one)
    assert user.valid?, 'User should be valid'
  end

  test 'user name should be valid' do
    user = users(:two)
    assert_not user.valid?, 'Name should have more 4 or more characters'
  end

  test 'user name should be unique' do
    user = User.new name: 'Juan'
    assert_not user.valid?, 'User name should be unique'
  end

  test 'user is not valid' do
    user = users(:three)
    assert_not user.valid?, 'User should not have a name'
  end
end
