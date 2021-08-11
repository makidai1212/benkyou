class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def show
  end

  def index

  end

  def create
      @project = current_user.projects.build(project_params)
      @project.save 
      flash[:success] = "学習内容を登録しました!"
      redirect_to root_path
  end


  def edit
    @project = Project.find_by(user_id: current_user.id)
  end

  def update
    @project = Project.find_by(user_id: current_user.id)
    if @project.update(project_params)
      flash[:success] = "登録を変更しました！"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def project_params
    params.require(:project).permit(:goal, :step_1, :step_2, :step_3, :step_4, :step_5, :step_6)
  end
end
