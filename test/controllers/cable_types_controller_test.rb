require 'test_helper'

class CableTypesControllerTest < ActionController::TestCase
  setup do
    @cable_type = cable_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cable_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cable_type" do
    assert_difference('CableType.count') do
      post :create, cable_type: { description: @cable_type.description, grams_per_metre: @cable_type.grams_per_metre, sku: @cable_type.sku }
    end

    assert_redirected_to cable_type_path(assigns(:cable_type))
  end

  test "should show cable_type" do
    get :show, id: @cable_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cable_type
    assert_response :success
  end

  test "should update cable_type" do
    patch :update, id: @cable_type, cable_type: { description: @cable_type.description, grams_per_metre: @cable_type.grams_per_metre, sku: @cable_type.sku }
    assert_redirected_to cable_type_path(assigns(:cable_type))
  end

  test "should destroy cable_type" do
    assert_difference('CableType.count', -1) do
      delete :destroy, id: @cable_type
    end

    assert_redirected_to cable_types_path
  end
end
