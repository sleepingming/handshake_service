require "test_helper"

class Admin::HandshakesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_handshakes_index_url
    assert_response :success
  end
end
