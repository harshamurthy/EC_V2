class ExerciseExecutionsController < ApplicationController
  before_action :set_exercise_execution, only: [:show, :edit, :update, :destroy]

  # GET /exercise_executions
  # GET /exercise_executions.json
  def index
    @exercise_executions = ExerciseExecution.all
  end

  # GET /exercise_executions/1
  # GET /exercise_executions/1.json
  def show
  end

  # GET /exercise_executions/new
  def new
    @exercise_execution = ExerciseExecution.new
  end

  # GET /exercise_executions/1/edit
  def edit
  end

  # POST /exercise_executions
  # POST /exercise_executions.json
  def create
    @exercise_execution = ExerciseExecution.new(exercise_execution_params)
    @exercise_execution.count = @exercise_execution.session.exercise_executions.count.to_i + 1

    respond_to do |format|
      if @exercise_execution.save
         @exercise = @exercise_execution.exercise
         @session = @exercise_execution.session
         @setting_execution = SettingExecution.where(exercise_id: @exercise_execution.exercise.id, client_id: @session.client.id).first || SettingExecution.new

        format.html { redirect_to @exercise_execution, notice: 'Exercise execution was successfully created.' }
        format.js
        format.json { render action: 'show', status: :created, location: @exercise_execution }
      else
        format.html { render action: 'new' }
        format.json { render json: @exercise_execution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_executions/1
  # PATCH/PUT /exercise_executions/1.json
  def update
    respond_to do |format|
      if @exercise_execution.update(exercise_execution_params)
        @exercise = @exercise_execution.exercise
        @session = @exercise_execution.session
        format.html { redirect_to @exercise_execution, notice: 'Exercise execution was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @exercise_execution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_executions/1
  # DELETE /exercise_executions/1.json
  def destroy
    @exercise_execution.destroy
    respond_to do |format|
      format.html { redirect_to exercise_executions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_execution
      @exercise_execution = ExerciseExecution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_execution_params
      params.require(:exercise_execution).permit(:weight, :percentage, :reps, :time, :exercise_id, :session_id)
    end
end
