class ProjectsController < ApplicationController
  layout "projects"
  def index
    # @projects = ruby_on_rails_project_items
    @projects = Project.all
  end

  def react 
    @react_projects = Project.react
  end

  def new
    @project = Project.new
    3.times{ @project.technologies.build}
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html {redirect_to projects_path, notice:"Your project has been added"}
      else
        format.html { render:new }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update 
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update(project_params)
        format.html {redirect_to projects_path, notice: "Project details has been updated"}
      else
        format.html { render:edit }
      end
    end
  end

  def show
    @project = Project.friendly.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html {redirect_to projects_path, notice: "Project has been deleted successfully."}
    end
  end

  private 

  def project_params
    params.require(:project).permit(:title,
                                    :subtitle,
                                    :body, 
                                    technologies_attributes: [:name])
  end

end
