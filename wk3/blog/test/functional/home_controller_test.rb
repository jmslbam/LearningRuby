require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get indexe" do
    get :indexe
    assert_response :success
  end

end
