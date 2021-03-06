class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  def index
    authorize! :index, User
    @users = User.order(:username).page params[:page]
    respond_to do |format|
      format.html
      format.json { render json: {meta:{total: User.all.count}, users: serialized_users(@users)} }
    end
  end

  # GET /admin/users/1
  def show
    authorize! :read, @user
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  # GET /admin/users/1/edit
  def edit
  end

  # PUT/PATCH /admin/users/1
  def update
    authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_user_path(@user), notice: 'User was successfully updated.' }
        format.json { render json: @user, status: :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  def destroy
    authorize! :destroy, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { head :no_content }
    end
  end

  private

  def serialized_users(users)
    ActiveModel::ArraySerializer.new(users).as_json
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :admin)
  end
end
