class CommentsController < ApplicationController
  before_action :authenticate

  def index
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
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
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = Comment.new(comment_params)
    @comment.task = @task
    @comment.user = current_user
    if @comment.save
      redirect_to (:back), notice: "Your comment was successfully added!"
    else
      render :new
    end
  end

private
  def comment_params
    params.require(:comment).permit(:description, :task_id, :user_id)
  end

end
