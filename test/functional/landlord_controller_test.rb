require 'test_helper'

class LandlordControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :success
  end

  test "should get activity" do
    get :activity
    assert_response :success
  end

end
