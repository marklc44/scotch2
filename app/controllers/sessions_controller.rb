class SessionsController < ApplicationController

  # before_action :render_layout_if_html

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
      render json: {}, status: 400
    end
  end

  def destroy
    session[:user_id] = nil
    # render text: "You've destroyed the session"
    respond_with nil
  end

  def logged_in_user
    if session[:user_id]
      render json: User.find_by_id(session[:user_id])
    end
  end

  # render main
end
