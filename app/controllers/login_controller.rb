class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user
      flash[:notice] = 'Successfully logged in'
      login(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_path
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end