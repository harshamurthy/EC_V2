class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = current_gym.sessions
    @sessions_by_date = @sessions.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @specific_date = params[:specific_date].to_date if params[:specific_date]
    @specific_sessions = Session.where(date: @specific_date)
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    if @session.exercise_executions.count > 0
      @exercises = @session.exercises.find(:all, :include => :exercise_executions, :order => "exercise_executions.count")
    else
      @exercises = @session.exercises
    end
    if params[:exercise_id].present?
      @setting_execution = SettingExecution.where(exercise_id: params[:exercise_id], client_id: @session.client.id).first || SettingExecution.new
      @exercise_execution = ExerciseExecution.where(exercise_id: params[:exercise_id], session_id: params[:id]).first || ExerciseExecution.new
      @exercise = Exercise.find_by_id(params[:exercise_id])
    else
      @exercise_execution = ExerciseExecution.where(exercise_id: @exercise = @session.exercises.first.id, session_id: @session.id).first || ExerciseExecution.new
      @setting_execution = SettingExecution.where(exercise_id: @exercise = @session.exercises.first.id, client_id: @session.client.id).first || SettingExecution.new
      @exercise = @session.exercises.first
    end
    if params[:notes].present?
      @client = @session.client
    end
  end

  # GET /sessions/new
  def new
    @session = Session.new
    @client = Client.find(params[:client_id])
    @routines = Routine.where(gym_id: current_gym.id)
    @routine = Routine.find(params[:routine_id]) if params[:routine_id]

    @arms = current_gym.exercises.where(category: "Arms")
    @legs = current_gym.exercises.where(category: "Legs")
    @chest = current_gym.exercises.where(category: "Chest")
    @abs = current_gym.exercises.where(category: "Abs")
    @back = current_gym.exercises.where(category: "Back")
    @shoulders = current_gym.exercises.where(category: "Shoulders")
    @other = current_gym.exercises.where(category: "Other")
  end

  # GET /sessions/1/edit
  def edit
    @client = Client.find(params[:client_id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)

    if @session.routine.nil?
      @session.routine = Routine.find_or_initialize_by_exercise_ids(routine_params[:exercise_ids])
      @session.routine.description = routine_params[:description]
      @session.routine.gym_id = current_gym.id
    end
      @session.routine.save!


    respond_to do |format|
      if @session.save
        if @session.date.to_date == Date.today
          format.html { redirect_to workout_session_url(@session) }
        else
          format.html { redirect_to workout_sessions_url(date: @session.date) }
        end
        format.json { render action: 'show', status: :created, location: @session }
      else
        format.html { render action: 'new' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to workout_session_url(@session), notice: 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to workout_sessions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:name, :date, :client_id, :routine_id, :coach)
    end

    def routine_params
      params.require(:session).require(:routine).permit!
    end
end
