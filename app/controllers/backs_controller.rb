class BacksController < ApplicationController
  def new
    @back = Back.new
  end

  def create
    project = Project.find(params[:project_id])
    @back = current_user.backs.new(back_params)
    @back.project_id = project.id 
    if @back.save
      flash[:notice] = ["thank you!"]
      redirect_to project_url(project)
    else
      flash.now[:errors] = @back.errors.full_messages
      render :new
    end
  end

  def edit
    @back = current_user.backs.where(project_id: params[:project_id]).first  
  end
  
  def update
    @back = current_user.backs.where(project_id: params[:project_id]).first  
    project = Project.find(params[:project_id])
    added_fund = params[:back][:added_fund].to_i
    total_fund = @back.amount + added_fund 
    if @back.update_attributes(amount: total_fund)
      redirect_to project_url(project)
      flash[:notice] = ["thank you!"]
    else
      flash.now[:errors] = @back.errors.full_messages
    end
  end
  private
  def back_params
    params.require(:back).permit(:amount)
  end
end
