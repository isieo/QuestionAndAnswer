require 'test_helper'

class AnswerSessionsControllerTest < ActionController::TestCase
  setup do
    @answer_session = answer_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answer_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answer_session" do
    assert_difference('AnswerSession.count') do
      post :create, :answer_session => @answer_session.attributes
    end

    assert_redirected_to answer_session_path(assigns(:answer_session))
  end

  test "should show answer_session" do
    get :show, :id => @answer_session.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @answer_session.to_param
    assert_response :success
  end

  test "should update answer_session" do
    put :update, :id => @answer_session.to_param, :answer_session => @answer_session.attributes
    assert_redirected_to answer_session_path(assigns(:answer_session))
  end

  test "should destroy answer_session" do
    assert_difference('AnswerSession.count', -1) do
      delete :destroy, :id => @answer_session.to_param
    end

    assert_redirected_to answer_sessions_path
  end
end
