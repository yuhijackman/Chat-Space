class ChatsController < ApplicationController

  def index
    @chat = Chat.new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.order('id DESC').limit(5)
    @users = @group.users
    @chats = @group.chats.last(4)
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
    params.require(:chat).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
