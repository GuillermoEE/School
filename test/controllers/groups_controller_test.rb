require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get groups_generate_url
    assert_response :success
  end

end
