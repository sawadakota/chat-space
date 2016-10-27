class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    message = Message.new(message_params)
    if message.save
      flash[:success] = 'メッセージを送信しました！'
      redirect_to :root
    else
      flash[:error] = 'メッセージが空です！'
      redirect_to :root
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image)
  end
end
