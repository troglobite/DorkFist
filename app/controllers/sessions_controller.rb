class SessionsController < ApplicationController
  def new
  end

  def create
    reset_session
    @user = User.find_by(email: [session_params[:email]])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Welcome back'  
      redirect_to root_path
    else
      flash[:error] = 'Wrong email and password combination'
      redirect_to login_path
    end
  end

  def destroy
    reset_session
  end

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end