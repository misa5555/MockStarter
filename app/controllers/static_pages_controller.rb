class StaticPagesController < ApplicationController
  def root
    @popular_projects = Project.all
  end
end
