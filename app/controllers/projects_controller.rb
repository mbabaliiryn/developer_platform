class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def index
    @projects = Project.order('name ASC')
  end

  def create
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    @project = Project.new(project_params)
    @project.user = @user
    @project.name = @project.name.capitalize
    if @project.save
      flash[:notice] = 'You project was created successfully'
      redirect_to project_path(@project)
    else
      flash[:alert] = project_errors(@project)
      render 'projects/new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @groups = @project.groups.includes([:user])
    @project.groups.includes([:tasks]).includes([:user])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = 'Your task was deleted'
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def project_errors(project)
    if project.errors.full_messages.size > 1
      a = "The following errors prevented you from saving the project: \n"
      project.errors.full_messages.each do |e|
        a += " - #{e} \n"
      end
      a
    else
      "The following errors prevented you from saving the project: #{project.errors.full_messages[0]}"
    end
  end
end
