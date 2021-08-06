class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate( paramas[:session][:password])
      log_in(user)
    else
      flash[:danger] = "メールアドレスかパスワードが間違っています"
      render 'new'
    end
  end

  def destroy 
    log_out
    redirect_to root_path
  end
end
