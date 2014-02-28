class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    if params[:search]
      @clients = Client.where("first_name || ' ' || last_name || ' ' ILIKE :search", :search => "%#{params[:search].downcase}%" ).order(first_name: :desc)
    else
      @clients = Client.where(gym_id: current_gym.id).order(first_name: :desc)
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client_chart = @client.sessions.group_by { |t| t.created_at }
    @exercise = Exercise.find(params[:exercise]) if !params[:exercise].blank?
    @type = params[:type] if params[:type].present?
    @exercises = @client.exercise_executions.map { |s| s.exercise  }.uniq
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_url(last_client: @client.id), notice: 'Client was successfully created.' }
        format.json { render action: 'show', status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  def note
    @n = Note.new
    @n.content = params[:content]
    @n.client_id = params[:client_id]
    @n.save

    respond_to do |format|
      format.html { redirect_to client_url(params[:client_id]) }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:gym_id, :first_name, :last_name, :email, :machine_code)
      # params.permit(:client_id, :content)
    end
end
