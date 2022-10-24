class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :admin_user

  def create
    @user = current_user.users.build(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: t('notice.create_users') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    # @user = current_user
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: t('notice.update_users') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :admin, :family_id, :kid_id, :password, :password_confirmation)
    end

  def no_access
		@user = User.find(params[:id])
		unless @user == current_user
		flash[:danger] = "アクセスする権限がありません"
		redirect_to posts_path
		end
	end

#   def admin_user
#     unless current_user.admin?
#       render :show, notice: "管理者以外はアクセスできません"
#     end
#   end
end
