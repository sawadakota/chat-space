class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update]

  def show
    @groups = Group.all
    @message = Message.new
    @messages = @group.messages
  end

  def new
    @group = Group.new
    @group.group_users.build
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
       flash[:notice] = 'グループを作成しました！'
       redirect_to root_path
    else
      flash[:alert] = 'グループ名を入力してください'
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
       flash[:notice] = 'グループを更新しました！'
       redirect_to group_path(@group)
    else
      flash[:alert] = 'グループ名を入力してください'
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(
      :name,
      user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
