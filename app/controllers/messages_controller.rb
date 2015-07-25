class MessagesController < ApplicationController

  def index
    @messages = Message.all.last(100)
    render :json => @messages
  end

  def create
    if session[:user_id]
      @message = Message.new(message_params)
      @message.update(user_id: session[:user_id])
      @message.save
      @messages = Message.all.last(100)
      render :json => @messages
    else
      render :error, layout: false
    end

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
