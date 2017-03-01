class GroupsController < ApplicationController
  before_action :find_id, only: [:edit, :show, :update]

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
    @group.update(group_params)
    redirect_to root_path, notice: 'チャットグループが更新されました'
  end


  private
  def group_params
    params.require(:group).permit(:name)
  end
  def find_id
    @group = Group.find(params[:id])
  end
end
