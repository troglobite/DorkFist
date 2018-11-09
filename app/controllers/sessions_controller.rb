class SessionsController < ApplicationController
  # skip_before_action :require_valid_user!, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by(email: [sessions_params[:email]])

    if @user && @user.authenticate(sessions_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "logged in"
    else
      flash[:error] = 'Wrong email and password combination'
      redirect_to login_path
    end
  end

  def destroy
    reset_session
  end

private
  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
