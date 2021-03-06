class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :login, :logged_in?, :current_user
  before_action :set_user

  def login(user)
    session[:user] = user.id
  end

  def logged_in?
    session[:user] != nil
  end

  def current_user
    if logged_in?
      User.find(session[:user])
    end
  end

  def logout
    session[:user] = nil
  end

  private

  def set_user
    if logged_in?
      @user = current_user
    end
  end
end
