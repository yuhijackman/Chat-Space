class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :show, :update]

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
  end

  def show
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: 'チャットグループが更新されました'
    else
      redirect_to edit_group_path, alert: '入力内容を確認してください'
    end
  end


  private
  def group_params
    params.require(:group).permit(:name)
  end
  def set_group
    @group = Group.find(params[:id])
  end
end
