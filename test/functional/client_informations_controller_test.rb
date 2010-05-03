require 'test_helper'

class ClientInformationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_information" do
    assert_difference('ClientInformation.count') do
      post :create, :client_information => { }
    end

    assert_redirected_to client_information_path(assigns(:client_information))
  end

  test "should show client_information" do
    get :show, :id => client_informations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_informations(:one).to_param
    assert_response :success
  end

  test "should update client_information" do
    put :update, :id => client_informations(:one).to_param, :client_information => { }
    assert_redirected_to client_information_path(assigns(:client_information))
  end

  test "should destroy client_information" do
    assert_difference('ClientInformation.count', -1) do
      delete :destroy, :id => client_informations(:one).to_param
    end

    assert_redirected_to client_informations_path
  end
end
