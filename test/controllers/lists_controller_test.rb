require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get lists_update_url
    assert_response :success
  end

end
