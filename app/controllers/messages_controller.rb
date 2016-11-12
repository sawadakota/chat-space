class MessagesController < ApplicationController
  def index
    @message = Message.new
    @groups = Group.all
  end

  def create
    @groups = Group.all
    @message = current_user.messages.new(message_params)
    if @message.save
      flash[:notice] = 'メッセージを送信しました！'
      redirect_to :back
    else
      flash[:alert] = 'メッセージを入力してください'
      redirect_to group_path(params[:group_id])
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end
end
