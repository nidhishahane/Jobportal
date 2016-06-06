class EducationsController < ApplicationController
  def index
  end

  def new
    @user = User.find(params[:user_id])
    @education=@user.educations.new
  end

  def create
    @user = User.find(params[:user_id])
    @education = @user.educations.new(education_params)
     @education.save
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(params[:user_id])
    @education=@user.educations.find(params[:id])
  end

  def update
  end

  private
  def education_params
    params.require(:education).permit(:course, :specialization,:institute,:passout_year)
  end
  
end
