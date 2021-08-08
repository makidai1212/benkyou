class UsersController < ApplicationController

before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
before_action :correct_user, only: [:edit, :update]
before_action :admin_user, only: :destroy

  def new 
    @user = User.new
  end 

  def create 
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = "User create!"
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = "メールアドレスかパスワードの内容が正しくありません"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "登録を変更しました！"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index 
    @users = User.all.limit(15).page(params[:page])
  end

  def destroy 
    @user = User.find(params[:id]).destroy
    flash[:success] = "#{@user.name} を闇に葬りました"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください！"
        redirect_to root_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
