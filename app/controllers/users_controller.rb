class UsersController < ApplicationController
  def index
  end

  def show
	@user = User.find(params[:id])
  end

  def destroy

  end

  def edit
	@user = User.find(params[:id])
  end

  def update
	@user = User.find(params[:id])

	if @user.update_attributes(user_params)
	   redirect_to user_path, notice: "The company has been successfully updated"
	end
  end
  
  private
  def user_params
	params.require(:user).permit!
  end
end
