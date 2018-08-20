require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get login" do
    get welcome_login_url
    assert_response :success
  end

  test "should post create" do
    post welcome_create_url
    assert_response :success
  end

end
