require 'test_helper'

class DrumTypesControllerTest < ActionController::TestCase
  setup do
    @drum_type = drum_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drum_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drum_type" do
    assert_difference('DrumType.count') do
      post :create, drum_type: { description: @drum_type.description, diameter: @drum_type.diameter, empty_grams: @drum_type.empty_grams, width: @drum_type.width }
    end

    assert_redirected_to drum_type_path(assigns(:drum_type))
  end

  test "should show drum_type" do
    get :show, id: @drum_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drum_type
    assert_response :success
  end

  test "should update drum_type" do
    patch :update, id: @drum_type, drum_type: { description: @drum_type.description, diameter: @drum_type.diameter, empty_grams: @drum_type.empty_grams, width: @drum_type.width }
    assert_redirected_to drum_type_path(assigns(:drum_type))
  end

  test "should destroy drum_type" do
    assert_difference('DrumType.count', -1) do
      delete :destroy, id: @drum_type
    end

    assert_redirected_to drum_types_path
  end
end
