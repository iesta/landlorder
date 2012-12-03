require 'test_helper'

class VenuesControllerTest < ActionController::TestCase
  setup do
    @venue = venues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venue" do
    assert_difference('Venue.count') do
      post :create, venue: { cat_color: @venue.cat_color, cat_id: @venue.cat_id, cat_image: @venue.cat_image, cat_name: @venue.cat_name, expected_profit: @venue.expected_profit, expected_rent: @venue.expected_rent, fsq_id: @venue.fsq_id, market_value: @venue.market_value, name: @venue.name, venuid: @venue.venuid }
    end

    assert_redirected_to venue_path(assigns(:venue))
  end

  test "should show venue" do
    get :show, id: @venue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @venue
    assert_response :success
  end

  test "should update venue" do
    put :update, id: @venue, venue: { cat_color: @venue.cat_color, cat_id: @venue.cat_id, cat_image: @venue.cat_image, cat_name: @venue.cat_name, expected_profit: @venue.expected_profit, expected_rent: @venue.expected_rent, fsq_id: @venue.fsq_id, market_value: @venue.market_value, name: @venue.name, venuid: @venue.venuid }
    assert_redirected_to venue_path(assigns(:venue))
  end

  test "should destroy venue" do
    assert_difference('Venue.count', -1) do
      delete :destroy, id: @venue
    end

    assert_redirected_to venues_path
  end
end
