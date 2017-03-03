class ChatsController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to group_chats_path
    else
      redirect_to :back, alert: 'メッセージを入力して下さい'
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @chat = Chat.new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.order('id DESC')
    @users = @group.users
    @chats = @group.chats
  end

end
