class ChatsController < ApplicationController

  def index
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to group_chats_path
    else
      flash.now[:alert] = 'メッセージを入力して下さい'
      render :index
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:body)
  end

end
