class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'チャットグループを作成しました'
    else
      redirect_to new_group_path, alert: 'グループ名を入力してください'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def show
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    if user_signed_in?
    group.update(group_params)
    redirect_to root_path, notice: 'チャットグループが更新されました'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
