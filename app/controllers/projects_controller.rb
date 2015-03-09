class ProjectsController < ApplicationController

  before_action :authenticate

    def index
      @projects = Project.all
      @tasks = Task.all
      @memberships = Membership.all
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
        redirect_to projects_path, notice: 'Project was successfully created.'
      else
        render :new
      end
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
        redirect_to projects_path, notice: 'Project was successfully Destoryed.'
    end


    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end

  end
