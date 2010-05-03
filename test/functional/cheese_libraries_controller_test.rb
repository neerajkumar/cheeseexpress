require 'test_helper'

class CheeseLibrariesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheese_libraries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheese_library" do
    assert_difference('CheeseLibrary.count') do
      post :create, :cheese_library => { }
    end

    assert_redirected_to cheese_library_path(assigns(:cheese_library))
  end

  test "should show cheese_library" do
    get :show, :id => cheese_libraries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cheese_libraries(:one).to_param
    assert_response :success
  end

  test "should update cheese_library" do
    put :update, :id => cheese_libraries(:one).to_param, :cheese_library => { }
    assert_redirected_to cheese_library_path(assigns(:cheese_library))
  end

  test "should destroy cheese_library" do
    assert_difference('CheeseLibrary.count', -1) do
      delete :destroy, :id => cheese_libraries(:one).to_param
    end

    assert_redirected_to cheese_libraries_path
  end
end
