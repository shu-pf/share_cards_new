require 'test_helper'

class RgsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rgs_index_url
    assert_response :success
  end

end
