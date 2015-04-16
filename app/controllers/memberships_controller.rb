class MembershipsController < ApplicationController
  before_action :authenticate
  before_action :set_project

  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships.all
    @membership = Membership.new
  end

  def show
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @membership = Membership.new
  end

  def create
    @project = Project.find(params[:project_id])
    @membership = Membership.new(membership_params)
    @membership.project_id = @project.id
    if @membership.save
      redirect_to project_memberships_path(@project),  notice: "#{@membership.user.full_name} was succesfully added!"
    else
      render :index
    end
  end


  def update
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
    if @membership.update(membership_params)
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was succesfully updated!"
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
    @membership.project_id = @project.id
    @membership.destroy
    redirect_to project_memberships_path(@project), alert: "#{@membership.user.full_name} was removed from the project!"
  end


  private
  def membership_params
    params.require(:membership).permit(:user_id, :project_id, :role)
  end

  def set_project
    @project = Project.find(params[:project_id])
    unless @project && @project.users.include?(current_user)
    redirect_to projects_path, alert: 'You do not have access to that project.'
  end
  end

end
