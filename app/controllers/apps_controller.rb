class AppsController < ApplicationController
  layout 'main'

  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  # GET /api/apps
  def index
    @apps = current_user.apps
    respond_to do |format|
      format.html
      format.json { render json: {apps: @apps, meta: {total:App.all.count}} }
    end
  end

  # GET /apps/1
  # GET /api/apps/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: @app }
    end
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps
  # POST /api/apps
  def create
    @app = App.new(app_params)
    @app.user = current_user
    if params[:postgres]
      @app.ensure_pg_db
    end

    respond_to do |format|
      if @app.save
        format.html { redirect_to edit_app_url(@app), notice: 'App was successfully created.' }
        format.json { render json: @app, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /api/apps/1
  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render json: @app, status: :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /api/apps/1
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was succussfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :status, :postgres)
    end
end
