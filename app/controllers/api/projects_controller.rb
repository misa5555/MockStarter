class Api::ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    render :show
  end
  
  def search
    @projects = Project.all

    render :result
  end
end
