require 'test_helper'

class SightingsControllerTest < ActionController::TestCase
  setup do
    @sighting = sightings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sightings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sighting" do
    assert_difference('Sighting.count') do
      post :create, sighting: { city: @sighting.city, duration: @sighting.duration, match_score: @sighting.match_score, posted_at: @sighting.posted_at, shape: @sighting.shape, sighted_at: @sighting.sighted_at, state: @sighting.state, summary: @sighting.summary, x_coord: @sighting.x_coord, y_coord: @sighting.y_coord }
    end

    assert_redirected_to sighting_path(assigns(:sighting))
  end

  test "should show sighting" do
    get :show, id: @sighting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sighting
    assert_response :success
  end

  test "should update sighting" do
    put :update, id: @sighting, sighting: { city: @sighting.city, duration: @sighting.duration, match_score: @sighting.match_score, posted_at: @sighting.posted_at, shape: @sighting.shape, sighted_at: @sighting.sighted_at, state: @sighting.state, summary: @sighting.summary, x_coord: @sighting.x_coord, y_coord: @sighting.y_coord }
    assert_redirected_to sighting_path(assigns(:sighting))
  end

  test "should destroy sighting" do
    assert_difference('Sighting.count', -1) do
      delete :destroy, id: @sighting
    end

    assert_redirected_to sightings_path
  end
end
