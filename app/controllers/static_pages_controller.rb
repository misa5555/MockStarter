class StaticPagesController < ApplicationController
  def root
    @projects = Project.order(:created_at).page(params[:page])
    respond_to do |format|
      format.html
      format.json
    end 
  end
end
