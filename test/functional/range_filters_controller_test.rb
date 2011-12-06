require 'test_helper'

class RangeFiltersControllerTest < ActionController::TestCase
  setup do
    @range_filter = range_filters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:range_filters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create range_filter" do
    assert_difference('RangeFilter.count') do
      post :create, range_filter: @range_filter.attributes
    end

    assert_redirected_to range_filter_path(assigns(:range_filter))
  end

  test "should show range_filter" do
    get :show, id: @range_filter.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @range_filter.to_param
    assert_response :success
  end

  test "should update range_filter" do
    put :update, id: @range_filter.to_param, range_filter: @range_filter.attributes
    assert_redirected_to range_filter_path(assigns(:range_filter))
  end

  test "should destroy range_filter" do
    assert_difference('RangeFilter.count', -1) do
      delete :destroy, id: @range_filter.to_param
    end

    assert_redirected_to range_filters_path
  end
end
