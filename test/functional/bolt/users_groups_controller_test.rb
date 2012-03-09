require 'test_helper'

class Bolt::UsersGroupsControllerTest < ActionController::TestCase
  setup do
    @bolt_users_group = bolt_users_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bolt_users_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bolt_users_group" do
    assert_difference('Bolt::UsersGroup.count') do
      post :create, :bolt_users_group => @bolt_users_group.attributes
    end

    assert_redirected_to bolt_users_group_path(assigns(:bolt_users_group))
  end

  test "should show bolt_users_group" do
    get :show, :id => @bolt_users_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bolt_users_group.to_param
    assert_response :success
  end

  test "should update bolt_users_group" do
    put :update, :id => @bolt_users_group.to_param, :bolt_users_group => @bolt_users_group.attributes
    assert_redirected_to bolt_users_group_path(assigns(:bolt_users_group))
  end

  test "should destroy bolt_users_group" do
    assert_difference('Bolt::UsersGroup.count', -1) do
      delete :destroy, :id => @bolt_users_group.to_param
    end

    assert_redirected_to bolt_users_groups_path
  end
end
