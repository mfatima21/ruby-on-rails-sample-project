require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user creation" do
    @user = User.new({name: "test user"})
    assert_not @user.save

    @user.name = "test user"
    @user.password = "1"
    @user.role = "Admin"
    @user.email = "test.user@gmail.com"
    assert_not @user.valid?
    assert @user.errors.full_messages, "Role Admin should be one of these admin, user"

    @user.role = "admin"
    assert @user.valid?
    assert @user.save
  end
end
