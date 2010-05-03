require 'test_helper'

class ContactUsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_us)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_us" do
    assert_difference('ContactUs.count') do
      post :create, :contact_us => { }
    end

    assert_redirected_to contact_us_path(assigns(:contact_us))
  end

  test "should show contact_us" do
    get :show, :id => contact_us(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contact_us(:one).to_param
    assert_response :success
  end

  test "should update contact_us" do
    put :update, :id => contact_us(:one).to_param, :contact_us => { }
    assert_redirected_to contact_us_path(assigns(:contact_us))
  end

  test "should destroy contact_us" do
    assert_difference('ContactUs.count', -1) do
      delete :destroy, :id => contact_us(:one).to_param
    end

    assert_redirected_to contact_us_path
  end
end
