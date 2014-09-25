class Api::ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    render :show
  end
end
