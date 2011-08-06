require 'test_helper'

class MasterEventsControllerTest < ActionController::TestCase
  setup do
    @master_event = master_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:master_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create master_event" do
    assert_difference('MasterEvent.count') do
      post :create, :master_event => @master_event.attributes
    end

    assert_redirected_to master_event_path(assigns(:master_event))
  end

  test "should show master_event" do
    get :show, :id => @master_event.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @master_event.to_param
    assert_response :success
  end

  test "should update master_event" do
    put :update, :id => @master_event.to_param, :master_event => @master_event.attributes
    assert_redirected_to master_event_path(assigns(:master_event))
  end

  test "should destroy master_event" do
    assert_difference('MasterEvent.count', -1) do
      delete :destroy, :id => @master_event.to_param
    end

    assert_redirected_to master_events_path
  end
end
