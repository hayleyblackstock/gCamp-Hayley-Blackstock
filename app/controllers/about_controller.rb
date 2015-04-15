class AboutController < ApplicationController
  def index
    @projects = Project.all
    @tasks = Task.all
    @users = User.all
    @comments = Comment.all
    @memberships = Membership.all
  end
end
