class UsersController < ApplicationController

  def search
    @users = User.where('nickname LIKE ?', "%#{params[:user_name]}%")
    respond_to do |format|
      format.json { render json: @users }
    end
  end

end
