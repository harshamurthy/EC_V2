class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    if params[:exercise_id].present?
      @setting_execution = SettingExecution.where(exercise_id: params[:exercise_id], client_id: @session.client.id).first || SettingExecution.new
      @exercise_execution = ExerciseExecution.where(exercise_id: params[:exercise_id], session_id: params[:id]).first || ExerciseExecution.new
      @exercise = Exercise.find_by_id(params[:exercise_id])
    else
      @exercise_execution = ExerciseExecution.where(exercise_id: @exercise = @session.exercises.first.id, session_id: @session.id).first || ExerciseExecution.new
      @setting_execution = SettingExecution.where(exercise_id: @exercise = @session.exercises.first.id, client_id: @session.client.id).first || SettingExecution.new
      @exercise = @session.exercises.first.id
    end
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)

    if @session.routine.nil?
      @session.routine = Routine.find_or_initialize_by_exercise_ids(routine_params[:exercise_ids])
      if @session.routine.description.nil?
        @session.routine.description = routine_params[:description]
      else
        flash[:notice] << "Hey! There was already a routine that had the exercises you wanted called #{@session.routine.description}, so we just set you up with that one!"
      end
      @session.routine.save!
    end

    respond_to do |format|
      if @session.save
        format.html { redirect_to workout_session_url(@session) }
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
      params.require(:session).permit(:name, :date, :client_id, :routine_id)
    end

    def routine_params
      params.require(:session).require(:routine).permit!
    end
end
