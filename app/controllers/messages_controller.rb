class MessagesController < ApplicationController

  def index
    @groups = Group.all
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    message = current_user.messages.new(message_params)
    if message.save
      render json: message, include: :user
    else
      render json: { errors: message.errors.full_messages}
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end
end
