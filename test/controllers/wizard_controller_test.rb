require 'test_helper'

class WizardControllerTest < ActionController::TestCase
  test "should get cable" do
    get :cable
    assert_response :success
  end

  test "should get drum" do
    get :drum
    assert_response :success
  end

  test "should get weight" do
    get :weight
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

  test "should get label" do
    get :label
    assert_response :success
  end

end
