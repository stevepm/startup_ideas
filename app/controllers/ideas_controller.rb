class IdeasController < ApplicationController
  before_action :require_login, only: [:new, :create]
  before_action :get_idea, only: [:show]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params.merge({user: @user}))
    if @idea.save
      flash[:notice] = 'Idea added!'
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  private

  def get_idea
    @idea = Idea.find(params[:id])
  end

  def require_login
    unless logged_in?
      flash[:error] = 'You must log in to add an idea'
      redirect_to root_path
    end
  end

  def idea_params
    params.require(:idea).permit(:title)
  end
end