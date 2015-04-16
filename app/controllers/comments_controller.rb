class CommentsController < ApplicationController
  before_action :authenticate
  before_action :set_project, :set_task

  def index
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    @comments = Comment.all
  end

  def new
    @task = Task.find(params[:task_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.task_id = @task.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to project_task_path(@project, @task), notice: "Your comment was successfully added!"
    else
      render :new
    end
  end

private
  def comment_params
    params.require(:comment).permit(:description, :task_id, :user_id)
  end

def set_task
  @task = Task.find(params[:task_id])
end

def set_project
  @project = Project.find(params[:project_id])
end

end
