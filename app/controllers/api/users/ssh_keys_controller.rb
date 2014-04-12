class Api::Users::SshKeysController < Api::BaseController
  before_action :set_ssh_key, only: [:show, :edit, :update, :destroy]

  # GET /ssh_keys
  def index
    @ssh_keys = SshKey.all
    render json: @ssh_keys
  end

  # GET /ssh_keys/1
  def show
    render json: @ssh_key
  end

  # POST /ssh_keys
  def create
    @ssh_key = SshKey.new(ssh_key_params)

    respond_to do |format|
      if @ssh_key.save
        format.json { render json: @ssh_key, status: :created }
      else
        format.json { render json: @ssh_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ssh_keys/1
  def update
    respond_to do |format|
      if @ssh_key.update(ssh_key_params)
        format.json { render json: @ssh_key, status: :ok }
      else
        format.json { render json: @ssh_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ssh_keys/1
  # DELETE /ssh_keys/1.json
  def destroy
    @ssh_key.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ssh_key
      @ssh_key = SshKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ssh_key_params
      params.require(:ssh_key).permit(:title, :fingerprint, :content, :user_id)
    end
end
