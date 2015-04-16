class ProjectsController < ApplicationController

  before_action :authenticate
  before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
      @projects = current_user.projects
    end

    def show
      @project = Project.find(params[:id])
    end

    def new
      @project = Project.new
    end

    def edit
      @project = Project.find(params[:id])
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        redirect_to project_tasks_path(@project), notice: 'Project was successfully created.'
      else
        render :new
      end
      @membership = Membership.create(project_id: @project.id, user_id: current_user.id, role: 1)
    end

    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to project_path, notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
        redirect_to projects_path, alert: 'Project was successfully Destoryed.'
    end


    private

    def set_project
      unless @project && @project.users.include?(current_user)
      redirect_to projects_path, alert: 'You do not have access to that project.'
    end
    end

    def project_params
      params.require(:project).permit(:name)
    end

  end
