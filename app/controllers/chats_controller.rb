class ChatsController < ApplicationController

  def index
  end

  def create
    Chat.create(chat_params)
    redirect_to group_chats_path
  end

  private

  def chat_params
    params.require(:chat).permit(:body)
  end

end
