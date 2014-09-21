class SessionsController < ApplicationController

  before_action :render_layout_if_html

  def new
    # my login form
  end

  def create
    @user = User.authenticate(params[:user][:email],params[:user][:password] )

    if @user
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "You have just logged in!!"
    else
      flash.now[:error] = "Cant log you in"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    # render text: "You've destroyed the session"
    redirect_to new_session_path
  end
end
