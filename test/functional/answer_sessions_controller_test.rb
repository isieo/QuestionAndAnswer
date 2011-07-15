require 'test_helper'

class AnswerSessionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => AnswerSession.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    AnswerSession.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    AnswerSession.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to answer_session_url(assigns(:answer_session))
  end

  def test_edit
    get :edit, :id => AnswerSession.first
    assert_template 'edit'
  end

  def test_update_invalid
    AnswerSession.any_instance.stubs(:valid?).returns(false)
    put :update, :id => AnswerSession.first
    assert_template 'edit'
  end

  def test_update_valid
    AnswerSession.any_instance.stubs(:valid?).returns(true)
    put :update, :id => AnswerSession.first
    assert_redirected_to answer_session_url(assigns(:answer_session))
  end

  def test_destroy
    answer_session = AnswerSession.first
    delete :destroy, :id => answer_session
    assert_redirected_to answer_sessions_url
    assert !AnswerSession.exists?(answer_session.id)
  end
end
