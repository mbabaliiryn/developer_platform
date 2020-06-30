class TasksController < ApplicationController
  def new
    @task = params[:group_id] ? Task.new(group_id: params[:group_id]) : Task.new
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
  end

  def create
    @task = Task.new(task_params)
    status = params[:status]
    user_id = params[:user_id]
    @task.status = status if status && user_id
    @task.user_id = user_id
    @task.amount = post

    if @task.save
      redirect_to group_path(@task.group)
      flash.now[:notice] = 'Your task was created with success.'
    else
      flash.now[:alert] = task_errors(@task)
      @user = current_user
      render 'tasks/new'
    end
  end

  def index
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    if @user != current_user && current_user.profile_type != 'Manager'
      redirect_to root_path
      flash[:alert] = "You need to be a Manager to see other user's tasks"
    end
    @all_tasks = Task.most_recent.where(user_id: current_user.id)
  end

  def externals
    @all_tasks = Task.most_recent.includes([:group])
    @external_tasks = current_user.external_tasks(@all_tasks)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = 'Your task was deleted'
    redirect_to tasks_path
  end

  private

  def task_errors(task)
    if task.errors.full_messages.size > 1
      a = "The following errors prevented you from saving the task: \n"
      task.errors.full_messages.each do |e|
        a += " - #{e} \n"
      end
      a
    else
      "The following errors prevented you from saving the task: #{task.errors.full_messages[0]}"
    end
  end

  def task_params
    params.require(:task).permit(:name, :user_id, :group_id, :status)
  end

  def amount_counter(minutes, hours)
    hours * (60 * 60) + minutes * 60
  end

  def post
    minutes = params[:task][:minutes].to_i
    hours = params[:task][:hours].to_i
    if params[:amount_real] != '0'
      params[:amount_real]
    else
      amount_counter(minutes, hours)
    end
  end
end
