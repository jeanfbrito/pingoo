class WatchersController < ApplicationController
  before_action :set_watcher, only: [:show, :edit, :update, :destroy]

  # GET /watchers
  def index
    @watchers = Watcher.all
  end

  # GET /watchers/1
  def show
  end

  # GET /watchers/new
  def new
    @watcher = Watcher.new
  end

  # GET /watchers/1/edit
  def edit
  end

  # POST /watchers
  def create
    @watcher = Watcher.new(watcher_params)

    if @watcher.save
      WatchJob.perform_now(@watcher.id)
      redirect_to @watcher, notice: 'Watcher was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /watchers/1
  def update
    if @watcher.update(watcher_params)
      redirect_to @watcher, notice: 'Watcher was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /watchers/1
  def destroy
    @watcher.destroy
    redirect_to watchers_url, notice: 'Watcher was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watcher
      @watcher = Watcher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def watcher_params
      params.require(:watcher).permit(:name, :url, :timer)
    end
end
