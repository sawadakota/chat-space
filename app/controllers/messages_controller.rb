class MessagesController < ApplicationController

  def index
    @groups = Group.all
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      flash[:notice] = 'メッセージを送信しました！'
      redirect_to :back
    else
      flash[:alert] = 'メッセージを入力してください'
      redirect_to group_messages_path(params[:group_id])
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end
end
