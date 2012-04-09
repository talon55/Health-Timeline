class EntriesController < ApplicationController
  load_and_authorize_resource :episode
  load_and_authorize_resource :entry, through: :episode

  # GET /entries/1
  # GET /entries/1.json
#  def show
#    @episode = Episode.find(params[:episode_id])
#    @entry = @episode.entries.find(params[:id])

#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @episode }
#    end
#  end

  # GET /entries/new
  # GET /entries/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @episode }
    end
  end

  # GET /entries/1/edit
  def edit

  end

  # POST /entries
  # POST /entries.json
  def create

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'Entry was successfully created.' }
        format.json { render json: @episode, status: :created, location: @episode }
      else
        format.html { render action: "new" }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @episode, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to @episode }
      format.json { head :no_content }
    end
  end
end
