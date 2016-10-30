class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = 'メッセージを送信しました！'
      redirect_to :root
    else
      flash[:alert] = 'メッセージを入力してください'
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image)
  end
end
