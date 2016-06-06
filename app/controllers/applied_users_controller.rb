class AppliedUsersController < ApplicationController
 
  def index
    @appliedusers = AppliedUser.all 
  end

  def show
    @applieduser = AppliedUser.find(params[:id])
  end

  def new
    @applieduser = AppliedUser.new(:vacancy_id => params[:vacancy_id])
    @applieduser.user_id = current_user.id
  end

  def create
    @applieduser = AppliedUser.new(applieduser_params)
    if @applieduser.save
        redirect_to appliedusers_path(@applieduser), notice: "The applieduser has been successfully created"
    end
  end

  def edit
     @applieduser = AppliedUser.find(params[:id])
  end

  def update
    @applieduser = AppliedUser.find(params[:id])
    if @applieduser.update_attributes(applieduser_params)
      redirect_to applieduser_path(@applieduser), notice: "The applieduser has been successfully updated"
    end
  end


  def destroy
    @applieduser = AppliedUser.find(params[:id])
    @applieduser.destroy
    redirect_to appliedusers_path, notice: "The applieduser has been successfully deleted"
  end
  
  private
  def applieduser_params
    params.require(:applieduser).permit! 
  end
end
