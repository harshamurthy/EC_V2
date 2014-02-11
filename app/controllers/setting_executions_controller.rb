class SettingExecutionsController < ApplicationController
  before_action :set_setting_execution, only: [:show, :edit, :update, :destroy]

  # GET /setting_executions
  # GET /setting_executions.json
  def index
    @setting_executions = SettingExecution.all
  end

  # GET /setting_executions/1
  # GET /setting_executions/1.json
  def show
  end

  # GET /setting_executions/new
  def new
    @setting_execution = SettingExecution.new
    @exercise = Exercise.find(params[:exercise_id])
  end

  # GET /setting_executions/1/edit
  def edit
  end

  # POST /setting_executions
  # POST /setting_executions.json
  def create

    @setting_execution = SettingExecution.new(setting_execution_params)

    respond_to do |format|
      if @setting_execution.save
         @exercise = @setting_execution.exercise
         @session = Session.find_by_id(@setting_execution.session_id)

        format.html { redirect_to @setting_execution, notice: 'Setting execution was successfully created.' }
        format.json { render action: 'show', status: :created, location: @setting_execution }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @setting_execution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setting_executions/1
  # PATCH/PUT /setting_executions/1.json
  def update
    respond_to do |format|
      if @setting_execution.update(setting_execution_params)
        format.html { redirect_to @setting_execution, notice: 'Setting execution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @setting_execution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setting_executions/1
  # DELETE /setting_executions/1.json
  def destroy
    @setting_execution.destroy
    respond_to do |format|
      format.html { redirect_to setting_executions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting_execution
      @setting_execution = SettingExecution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_execution_params
      params.require(:setting_execution).permit(:seat, :foot, :degrees, :back, :client_id, :exercise_id, :foot_stool, :pin, :arm, :seatbelt, :backpad, :knee, :seatpad, :chestpad, :hips, :leg, :session_id)
    end
end
