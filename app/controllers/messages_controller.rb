class MessagesController < ApplicationController

  def index
    @messages = Message.all.last(100)
    render @messages
  end

  def create
    @message = Message.new(message_params)
    @message.update(user_id: session[:user_id])
    @message.save
    @messages = Message.all.last(100)
    render @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
