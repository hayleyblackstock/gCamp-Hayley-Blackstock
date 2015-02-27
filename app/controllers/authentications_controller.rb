class AuthenticationsController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to root_path, notice: 'Welcome back to gCamp!'
  else
    @sign_in_error = "Username / password combination is invalid"
    render :new
  end
end


def destroy
  session.destroy
  redirect_to root_path, notice: "You are successfully signed out! Come back soon!"
end

end
