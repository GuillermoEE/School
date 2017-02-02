require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_index_url
    assert_response :success
  end

  test "should get desarolladores" do
    get public_desarolladores_url
    assert_response :success
  end

  test "should get admisiones" do
    get public_admisiones_url
    assert_response :success
  end

end
