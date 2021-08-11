class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def show
    @project = User.find(params[:id])
  end

  def index

  end

  def create
      @project = Project.new(project_params)
      @project.save 
      flash[:success] = "学習内容を登録しました!"
      redirect_to root_path
  end


  def edit

  end

  def update

  end

  private
  def project_params
    params.require(:project).permit(:goal, :step_1, :step_2, :step_3, :step_4, :step_5, :step_6)
  end
end
