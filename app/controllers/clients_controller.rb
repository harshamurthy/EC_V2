class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :new_stat, :stat_index]

  # GET /clients
  # GET /clients.json
  def index
    if params[:search]
      @clients = current_gym.clients.where("first_name || ' ' || last_name || ' ' ILIKE :search", :search => "%#{params[:search].downcase}%" ).order(first_name: :desc)
    else
      @clients = Client.where(gym_id: current_gym.id).order(first_name: :desc)
      # @clients = Client.all
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client_chart = @client.sessions.group_by { |t| t.created_at }
    @exercise = Exercise.find(params[:exercise]) if !params[:exercise].blank?
    @type = params[:type] if params[:type].present?
    @exercises = @client.exercise_executions.map { |s| s.exercise  }.uniq
    @previous_sessions = @client.sessions.where(done: true)
    @current_card = @client.cards.last if @client.cards.any?

    if @current_card
      if @current_card.sessions.where(done: true).any? && @current_card.sessions.where(done: true).order('sessions.finished_at ASC').last.session_tag == 'A'
        @next_session_tag = 'B'
      elsif @current_card.sessions.where(done: true).any? && @current_card.sessions.where(done: true).order('sessions.finished_at ASC').last.session_tag == 'B'
        if @current_card.sessions.where(session_tag: 'C').any?
          @next_session_tag = 'C'
        else
          @next_session_tag = 'A'
        end
      else
        @next_session_tag = 'A'
      end
    end

    @next_session = @current_card.next_session(@next_session_tag) if @current_card
    @last_session = @current_card.sessions.where(done: true).last if @current_card


    @a = @client.sessions.where(done: nil).where(session_tag: 'A')
    @b = @client.sessions.where(done: nil).where(session_tag: 'B')
    @c = @client.sessions.where(done: nil).where(session_tag: 'C')

    if @b.empty? && @c.empty?
      @upcoming_sessions_by_session_tag = @a
    elsif @b && @c.empty?
      @upcoming_sessions_by_session_tag = @a.zip(@b).flatten
    else
      @upcoming_sessions_by_session_tag = @a.zip(@b, @c).flatten
    end

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
        format.html { redirect_to client_url(@client.id), notice: 'Client was successfully created.' }
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

  def new_stat

  end

  def stat
    @stat.new(stat_params)
  end

  def stat_index

  end

  def stat_show
    @client_stat = ClientStat.find(params[:client_stat_id])
    @client = Client.find(params[:id])
    @photo = @client.photos.stats_photo(@client_stat.created_at).first
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:gym_id, :first_name, :last_name, :email, :machine_code, :avatar, :gender, :photos_attributes => [:avatar, :id], :client_stats_attributes => [:id, :weight, :skeletal_muscle_mass, :body_fat_mass, :percent_body_fat, :right_arm, :left_arm, :trunk, :right_leg, :basal_metabolic_rate, :fat_to_lose, :muscle_to_gain], :goals_attributes => [:content, :id])
    end

    def stat_params

    end
end
