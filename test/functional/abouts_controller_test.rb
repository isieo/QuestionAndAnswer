require 'test_helper'

class AboutsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => About.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    About.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    About.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to about_url(assigns(:about))
  end

  def test_edit
    get :edit, :id => About.first
    assert_template 'edit'
  end

  def test_update_invalid
    About.any_instance.stubs(:valid?).returns(false)
    put :update, :id => About.first
    assert_template 'edit'
  end

  def test_update_valid
    About.any_instance.stubs(:valid?).returns(true)
    put :update, :id => About.first
    assert_redirected_to about_url(assigns(:about))
  end

  def test_destroy
    about = About.first
    delete :destroy, :id => about
    assert_redirected_to abouts_url
    assert !About.exists?(about.id)
  end
end
