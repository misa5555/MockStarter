class ProjectsController < ApplicationController
  def index
    @projects = Project.order("created_at desc").page(params[:page]).per_page(3)
  end

  def new
    @project = Project.new
    render :new
  end
  
  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to project_url(@project)
    else
      flash.now[:errors] = @project.errors.full_messages
      render :new
    end
  end
  
  def show
    @project = Project.find(params[:id])
    tagname = Rails.application.config.categories[@project.category_id] 
    render :show, :locals => { :tagname => tagname}
  end

  def edit
    @project = Project.find(params[:id])
    render :edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_url(@project)
    else
      flash.now[:errors] = @project.errors.full_messages
      render :edit
    end
  end
  
  def backer_index
    @backers = Project.find(params[:project_id]).backers
  end

  def discover
    
  end
  
  private
  def project_params
    params.require(:project).permit(:title, :target_amount, :end_date, :category_id, :description, :project_photo)
  end
end
