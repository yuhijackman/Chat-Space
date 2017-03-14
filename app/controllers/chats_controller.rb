class ChatsController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
    @chat = Chat.new
    @chats = @group.chats
    respond_to do |format|
      format.html
      format.json { render json: @chats }
    end
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      respond_to do |format|
        format.html { redirect_to group_chats_path }
        format.json { render json: {chat: @chat, name: @chat.user.nickname} }
      end
    else
      flash.now[:alert] = 'メッセージを入力して下さい'
      render :index
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.order('id DESC')
  end

end
