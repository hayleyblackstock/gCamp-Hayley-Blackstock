class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    User.find_by_id(session[:user_id])
  end

  helper_method :current_user

  def authenticate
    if not current_user
      redirect_to signup_path, alert: 'Not signed in!'
    end
  end

  def current_role
    if session[:user_id]
      @current_role ||= User.find(session[:user_id]).role
    else
      @current_role = "visitor"
    end
  end
  helper_method :current_role

  def admin_user
    if current_role != "admin"
      redirect_to root_path, alert: "You don't have access!"
    end
  end
  helper_method :admin_user

end
