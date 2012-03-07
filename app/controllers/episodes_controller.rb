class EpisodesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :only => [:show,:destroy,:edit,:update]


  # Note that devise ensures proper behavior of :index, :new, and :create

  # GET /episodes
  # GET /episodes.json
  def index
    if current_user.role? :admin
      @episodes = Episode.all
    else
      @episodes = current_user.viewable_episodes
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @episodes }
    end
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @episode }
    end
  end

  # GET /episodes/1/edit
  def edit
  end

  # GET /episodes/new
  # GET /episodes/new.json
  def new
    @episode = current_user.episodes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @episode }
    end
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = current_user.episodes.new(params[:episode])

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
        format.json { render json: @episode, status: :created, location: @episode }
      else
        format.html { render action: "new" }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /episodes/1
  # PUT /episodes/1.json
  def update

    respond_to do |format|
      if @episode.update_attributes(params[:episode])
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy

    respond_to do |format|
      format.html { redirect_to episodes_url }
      format.json { head :ok }
    end
  end
end
