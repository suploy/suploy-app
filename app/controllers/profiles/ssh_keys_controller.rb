class Profiles::SshKeysController < ApplicationController
  layout 'main'

  before_action :set_ssh_key, only: [:show, :edit, :update, :destroy]
  before_action :set_ssh_keys, only: [:index, :create]

  # GET /ssh_keys
  def index
    @ssh_key = SshKey.new
    respond_to do |format|
      format.html
      format.json { render json: @ssh_keys }
    end
  end

  # POST /ssh_keys
  def create
    @ssh_key = SshKey.new(ssh_key_params)
    @ssh_key.user = current_user

    respond_to do |format|
      if @ssh_key.save
        format.html { redirect_to profiles_ssh_keys_path }
        format.json { render json: @ssh_key, status: :created }
      else
        format.html { render action: 'index' }
        format.json { render json: @ssh_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ssh_keys/1
  # DELETE /ssh_keys/1.json
  def destroy
    @ssh_key.destroy
    respond_to do |format|
      format.html { redirect_to profiles_ssh_keys_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ssh_key
      @ssh_key = SshKey.find(params[:id])
    end

    def set_ssh_keys
      @ssh_keys = current_user.ssh_keys
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ssh_key_params
      params.require(:ssh_key).permit(:title, :fingerprint, :content, :user_id)
    end
end
