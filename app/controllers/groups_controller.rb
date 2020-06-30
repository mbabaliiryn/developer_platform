class GroupsController < ApplicationController
  def new
    @group = params[:project_id] ? Group.new(project_id: params[:project_id]) : Group.new
    @font_list = Group.font_awesome_list
  end

  def index
    @groups = Group.includes([:project]).order('name ASC')
  end

  def show
    @group = Group.find(params[:id])
    @tasks = current_user.see_my_tasks(@group.tasks.most_recent.includes([:user]))
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = 'Your group was deleted'
    redirect_to groups_path
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    @group.name = @group.name.capitalize
    if @group.save
      redirect_to groups_path
      flash.now[:notice] = 'Your group was created successfully'
    else
      @font_list = Group.font_awesome_list
      flash.now[:alert] = group_errors(@group)
      render 'groups/new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:icon, :name, :project_id)
  end

  def group_errors(group)
    if group.errors.full_messages.size > 1
      a = "The following errors prevented you from saving the group: \n"
      group.errors.full_messages.each do |e|
        a += " - #{e} \n"
      end
      a
    else
      "The following errors prevented you from saving the group: #{group.errors.full_messages[0]}"
    end
  end
end
