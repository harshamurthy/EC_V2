require 'test_helper'

class SettingExecutionsControllerTest < ActionController::TestCase
  setup do
    @setting_execution = setting_executions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:setting_executions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setting_execution" do
    assert_difference('SettingExecution.count') do
      post :create, setting_execution: { arm: @setting_execution.arm, back: @setting_execution.back, backpad: @setting_execution.backpad, chestpad: @setting_execution.chestpad, degrees: @setting_execution.degrees, exercise_id: @setting_execution.exercise_id, foot: @setting_execution.foot, foot_stool: @setting_execution.foot_stool, hips: @setting_execution.hips, knee: @setting_execution.knee, leg: @setting_execution.leg, pin: @setting_execution.pin, seat: @setting_execution.seat, seatbelt: @setting_execution.seatbelt, seatpad: @setting_execution.seatpad, user_id: @setting_execution.user_id }
    end

    assert_redirected_to setting_execution_path(assigns(:setting_execution))
  end

  test "should show setting_execution" do
    get :show, id: @setting_execution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @setting_execution
    assert_response :success
  end

  test "should update setting_execution" do
    patch :update, id: @setting_execution, setting_execution: { arm: @setting_execution.arm, back: @setting_execution.back, backpad: @setting_execution.backpad, chestpad: @setting_execution.chestpad, degrees: @setting_execution.degrees, exercise_id: @setting_execution.exercise_id, foot: @setting_execution.foot, foot_stool: @setting_execution.foot_stool, hips: @setting_execution.hips, knee: @setting_execution.knee, leg: @setting_execution.leg, pin: @setting_execution.pin, seat: @setting_execution.seat, seatbelt: @setting_execution.seatbelt, seatpad: @setting_execution.seatpad, user_id: @setting_execution.user_id }
    assert_redirected_to setting_execution_path(assigns(:setting_execution))
  end

  test "should destroy setting_execution" do
    assert_difference('SettingExecution.count', -1) do
      delete :destroy, id: @setting_execution
    end

    assert_redirected_to setting_executions_path
  end
end
