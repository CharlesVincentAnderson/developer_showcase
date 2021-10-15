class ProjectsController < ApplicationController
  layout 'projects_layout'

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    @project.feature.build
    count = 0
    @project.portfolio_id = current_user.portfolio.id
    portfolio = @project.portfolio
    count = portfolio.projects.length
    if @project.save
      redirect_to portfolio_path(current_user.portfolio, sub_view: "project,#{count}"), notice: "Project added successfully"
    else
      redirect_to portfolio_path(current_user.portfolio, sub_view: "project,#{count}"), alert: "Project could not be added"
    end
  end

  def edit
    @project = Project.find params[:id]  
  end

  def update
    count = 0
    @project = Project.find params[:id]
    portfolio = @project.portfolio
    for i in 0...portfolio.projects.length
      count = i if portfolio.projects[i] == @project
    end
    if @project.update project_params
      redirect_to portfolio_path(current_user.portfolio, sub_view: "project,#{count}"), notice: "Project updated successfully"
    else
      redirect_to portfolio_path(current_user.portfolio, sub_view: "project,#{count}"), alert: "Project could not be updated"
    end
  end

  def destroy
    project = Project.find params[:id]
    if project.destroy
      redirect_to portfolio_path(current_user.portfolio, sub_view: "about"), notice: "Project deleted successfully"
    else
      redirect_to portfolio_path(current_user.portfolio, sub_view: "about"), notice: "Project could not be deleted"
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :role, :github)
  end
end
