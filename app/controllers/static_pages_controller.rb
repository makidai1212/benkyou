class StaticPagesController < ApplicationController
  def home
    @project = Project.find_by(user_id: current_user)
  end

  def about
  end

  def contact
    
  end
end
