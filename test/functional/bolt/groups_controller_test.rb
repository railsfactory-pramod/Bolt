require 'test_helper'

class Bolt::GroupsControllerTest < ActionController::TestCase
  setup do
    @bolt_group = bolt_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bolt_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bolt_group" do
    assert_difference('Bolt::Group.count') do
      post :create, :bolt_group => @bolt_group.attributes
    end

    assert_redirected_to bolt_group_path(assigns(:bolt_group))
  end

  test "should show bolt_group" do
    get :show, :id => @bolt_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bolt_group.to_param
    assert_response :success
  end

  test "should update bolt_group" do
    put :update, :id => @bolt_group.to_param, :bolt_group => @bolt_group.attributes
    assert_redirected_to bolt_group_path(assigns(:bolt_group))
  end

  test "should destroy bolt_group" do
    assert_difference('Bolt::Group.count', -1) do
      delete :destroy, :id => @bolt_group.to_param
    end

    assert_redirected_to bolt_groups_path
  end
end
