require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area = areas(:one)
  end

  test "should get index" do
    get areas_url
    assert_response :success
  end

  test "should get new" do
    get new_area_url
    assert_response :success
  end

  test "should create area" do
    assert_difference('Area.count') do
      post areas_url, params: { area: { avatar: @area.avatar, location: @area.location, num_of_guest: @area.num_of_guest, partner_id: @area.partner_id, price_per_night: @area.price_per_night, type: @area.type } }
    end

    assert_redirected_to area_url(Area.last)
  end

  test "should show area" do
    get area_url(@area)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_url(@area)
    assert_response :success
  end

  test "should update area" do
    patch area_url(@area), params: { area: { avatar: @area.avatar, location: @area.location, num_of_guest: @area.num_of_guest, partner_id: @area.partner_id, price_per_night: @area.price_per_night, type: @area.type } }
    assert_redirected_to area_url(@area)
  end

  test "should destroy area" do
    assert_difference('Area.count', -1) do
      delete area_url(@area)
    end

    assert_redirected_to areas_url
  end
end
