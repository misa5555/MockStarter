class BacksController < ApplicationController
  def new
    @back = Back.new
  end

  def create
    project = Project.find(params[:project_id])
    @back = current_user.backs.new(back_params)
    @back.project_id = project.id 
    if @back.save
      redirect_to project_url(project)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  private
  def back_params
    params.require(:back).permit(:amount)
  end
end
