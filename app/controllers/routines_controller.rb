class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy]
  before_action :set_exercises, only: [:new]
  # GET /routines
  # GET /routines.json
  def index
    @routines = Routine.all
  end

  # GET /routines/1
  # GET /routines/1.json
  def show
  end

  # GET /routines/new
  def new
    @routine = Routine.new
  end

  # GET /routines/1/edit
  def edit
  end

  # POST /routines
  # POST /routines.json
  def create
    @routine = Routine.new(routine_params)
    respond_to do |format|
      if @routine.save
        format.html { redirect_to @routine, notice: 'Routine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @routine }
      else
        format.html { render action: 'new' }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routines/1
  # PATCH/PUT /routines/1.json
  def update
    @exercises = Exercise.where(id: params[:routine][:exercise_ids])
    @session = Session.find(params[:session_id])
    @new_routine = Routine.find_or_initialize_by_exercise_ids(params[:routine][:exercise_ids])


    @new_routine.description = "Routine ##{Routine.all.count + 1}"

    if @new_routine.id.nil?
      @new_routine.gym_id = current_gym.id
    end

    respond_to do |format|
      if @new_routine.save
         @session.routine = @new_routine
         @session.save
        format.html { redirect_to @routine, notice: 'Routine was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routines/1
  # DELETE /routines/1.json
  def destroy
    @routine.destroy
    respond_to do |format|
      format.html { redirect_to routines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = Routine.find(params[:id])
    end

    def set_exercises
      @exercises = Exercise.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def routine_params
      params.require(:routine).permit(:description, :gym_id, exercise_ids: [])
    end
end
