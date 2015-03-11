class MembershipsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
  end

  def show
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.find(params[:id])
  end

end
