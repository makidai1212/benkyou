class ProjectsController < ApplicationController

  def new
  end

  def show
    @project = User.find(params[:id])
  end

  def edit

  end

  def update

  end
end
