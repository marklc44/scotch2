class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
    if session[:user_id] != nil
      redirect_to root_path
    end
  end

  def create
    new_user = params[:user].permit(:email, :dob, :password, :password_confirmation)
    check_if_new_user = User.new(new_user)

    if check_if_new_user.save!
      redirect_to sessions_new_path, :notice => "User Created!"
    else
      flash.now[:notice]="Can't create user"
      @user = User.new
      render 'users/new'
    end
  end

  def update
  end
end
