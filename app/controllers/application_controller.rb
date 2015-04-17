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
      session[:previous_url] = request.fullpath
      redirect_to signin_path, alert: 'Not signed in!'
    end
  end

  def current_role
    if session[:user_id]
      @current_role = User.find_by_id(session[:user_id]).admin
    else
      @current_role = "visitor"
    end
  end
  helper_method :current_role

  def admin_user
    if current_role != true
      redirect_to (:back), alert: "You don't have admin rights!"
    end
  end
  helper_method :admin_user



end
