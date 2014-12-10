require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "foobar@example.com",
                    password: "foobar", password_confirmation: "foobar", service: true)
  end

  test "Should be valid" do
    assert @user.valid?
  end

  test "user name present" do
    @user.name = "       "
    assert_not @user.valid?
  end

  test "user email present" do
    @user.email = "      "
    assert_not @user.valid?
  end

  test "user length valid" do
    @user.name = "a" * 251
    assert_not @user.valid?
  end

  test "email length valid" do
    @user.email = "a" * 51
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
    dup_user = @user.dup
    dup_user.email = @user.email.downcase
    @user.save
    assert_not dup_user.valid?
  end

  test "password length should be above minimum" do
    @user.password = @user.password_confirmation = "foo"
    assert_not @user.valid?
  end

  test "service should be a boolean" do
    @user.service = false
    assert_equal @user.service, false
  end
end
