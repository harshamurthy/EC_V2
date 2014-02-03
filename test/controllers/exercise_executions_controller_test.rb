require 'test_helper'

class ExerciseExecutionsControllerTest < ActionController::TestCase
  setup do
    @exercise_execution = exercise_executions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercise_executions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exercise_execution" do
    assert_difference('ExerciseExecution.count') do
      post :create, exercise_execution: { back: @exercise_execution.back, degrees: @exercise_execution.degrees, foot: @exercise_execution.foot, percentage: @exercise_execution.percentage, reps: @exercise_execution.reps, seat: @exercise_execution.seat, time: @exercise_execution.time, weight: @exercise_execution.weight }
    end

    assert_redirected_to exercise_execution_path(assigns(:exercise_execution))
  end

  test "should show exercise_execution" do
    get :show, id: @exercise_execution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exercise_execution
    assert_response :success
  end

  test "should update exercise_execution" do
    patch :update, id: @exercise_execution, exercise_execution: { back: @exercise_execution.back, degrees: @exercise_execution.degrees, foot: @exercise_execution.foot, percentage: @exercise_execution.percentage, reps: @exercise_execution.reps, seat: @exercise_execution.seat, time: @exercise_execution.time, weight: @exercise_execution.weight }
    assert_redirected_to exercise_execution_path(assigns(:exercise_execution))
  end

  test "should destroy exercise_execution" do
    assert_difference('ExerciseExecution.count', -1) do
      delete :destroy, id: @exercise_execution
    end

    assert_redirected_to exercise_executions_path
  end
end
