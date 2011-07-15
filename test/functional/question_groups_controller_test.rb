require 'test_helper'

class QuestionGroupsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => QuestionGroup.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    QuestionGroup.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    QuestionGroup.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to question_group_url(assigns(:question_group))
  end

  def test_edit
    get :edit, :id => QuestionGroup.first
    assert_template 'edit'
  end

  def test_update_invalid
    QuestionGroup.any_instance.stubs(:valid?).returns(false)
    put :update, :id => QuestionGroup.first
    assert_template 'edit'
  end

  def test_update_valid
    QuestionGroup.any_instance.stubs(:valid?).returns(true)
    put :update, :id => QuestionGroup.first
    assert_redirected_to question_group_url(assigns(:question_group))
  end

  def test_destroy
    question_group = QuestionGroup.first
    delete :destroy, :id => question_group
    assert_redirected_to question_groups_url
    assert !QuestionGroup.exists?(question_group.id)
  end
end
