class GroupsController < ApplicationController

  def show
    @groups = Group.all
    @group = Group.find(params[:id])
    @message = Message.new
    @messages = @group.messages
  end

  def new
    @group = Group.new
    @group.group_users.new
    @users = User.all
  end

  def create
    @group = Group.create(group_params)
    redirect_to :root
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to :root
  end

  private
  def group_params
    params.require(:group).permit(
      :name,
      user_ids: [])
  end
end
