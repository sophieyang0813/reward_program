require 'test_helper'

class PromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promotion = promotions(:one)
  end

  test "should get index" do
    get promotions_url
    assert_response :success
  end

  test "should get new" do
    get new_promotion_url
    assert_response :success
  end

  test "should create promotion" do
    assert_difference('Promotion.count') do
      post promotions_url, params: { promotion: { area_id: @promotion.area_id, avatar: @promotion.avatar, description: @promotion.description, name: @promotion.name, point: @promotion.point, reward_type: @promotion.reward_type, terms_conditions: @promotion.terms_conditions, valid_from: @promotion.valid_from, valid_to: @promotion.valid_to } }
    end

    assert_redirected_to promotion_url(Promotion.last)
  end

  test "should show promotion" do
    get promotion_url(@promotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_promotion_url(@promotion)
    assert_response :success
  end

  test "should update promotion" do
    patch promotion_url(@promotion), params: { promotion: { area_id: @promotion.area_id, avatar: @promotion.avatar, description: @promotion.description, name: @promotion.name, point: @promotion.point, reward_type: @promotion.reward_type, terms_conditions: @promotion.terms_conditions, valid_from: @promotion.valid_from, valid_to: @promotion.valid_to } }
    assert_redirected_to promotion_url(@promotion)
  end

  test "should destroy promotion" do
    assert_difference('Promotion.count', -1) do
      delete promotion_url(@promotion)
    end

    assert_redirected_to promotions_url
  end
end
