class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task
  
  def index
    @tasks = @user.tasks
  end
  
  def show
  end
  
  def new
  end
  
  def edit
  end
  
  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def set_task
    @task = @user.tasks.find_by(id: params[:id])
  end
  
end
