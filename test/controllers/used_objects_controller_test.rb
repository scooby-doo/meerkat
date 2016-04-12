require 'test_helper'

class UsedObjectsControllerTest < ActionController::TestCase
  setup do
    @used_object = used_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:used_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create used_object" do
    assert_difference('UsedObject.count') do
      post :create, used_object: { description: @used_object.description, name: @used_object.name }
    end

    assert_redirected_to used_object_path(assigns(:used_object))
  end

  test "should show used_object" do
    get :show, id: @used_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @used_object
    assert_response :success
  end

  test "should update used_object" do
    patch :update, id: @used_object, used_object: { description: @used_object.description, name: @used_object.name }
    assert_redirected_to used_object_path(assigns(:used_object))
  end

  test "should destroy used_object" do
    assert_difference('UsedObject.count', -1) do
      delete :destroy, id: @used_object
    end

    assert_redirected_to used_objects_path
  end
end
