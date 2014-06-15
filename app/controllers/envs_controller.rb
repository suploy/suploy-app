class EnvsController < ApplicationController
  before_action :set_env, only: [:show, :edit, :update, :destroy]

  # GET /envs
  def index
    @envs = Env.all
  end

  # GET /envs/1
  def show
  end

  # GET /envs/new
  def new
    @env = Env.new
  end

  # GET /envs/1/edit
  def edit
  end

  # POST /envs
  def create
    @env = Env.new(env_params)

    if @env.save
      redirect_to @env, notice: 'Env was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /envs/1
  def update
    if @env.update(env_params)
      redirect_to @env, notice: 'Env was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /envs/1
  def destroy
    @env.destroy
    redirect_to envs_url, notice: 'Env was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_env
      @env = Env.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def env_params
      params.require(:env).permit(:name, :value)
    end
end
