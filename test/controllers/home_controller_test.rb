require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get pics" do
    get :pics
    assert_response :success
  end

end
