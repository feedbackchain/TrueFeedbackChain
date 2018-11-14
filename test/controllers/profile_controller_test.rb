require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get profile_new_url
    assert_response :success
  end

  test "should get create" do
    get profile_create_url
    assert_response :success
  end

end
