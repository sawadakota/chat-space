class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to :root
  end

  private
  def message_params
    params.require(:message).permit(:body, :image)
  end
end
