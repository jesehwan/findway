require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  test "should get paper" do
    get :paper
    assert_response :success
  end

  test "should get next" do
    get :next
    assert_response :success
  end

  test "should get finish" do
    get :finish
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
