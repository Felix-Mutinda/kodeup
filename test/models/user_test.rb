require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new email: "3mutindafelix@gmail.com", password: "pass", username: "Third-Felix"
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username  = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foor.bar.org
                          first.last@foo.jp alice+bob@foo.baz ]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid email addresses" do
    invalid_addresses = %w[user@example,com us_er_foo.com user@forr. 
                            first@foo_bax.com last@tty+vim.com last@yoo..ghg...com ]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save

    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as downcase" do
    caps_email = "ALLCAPS@GMAIL.COM"
    @user.email = caps_email
    @user.save

    assert_equal caps_email.downcase, @user.reload.email
  end

end
