class AuthenticationsController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path, notice: 'Welcome back to gCamp!'
  else
    @user.errors[:base] << "Invalid email / password"
    render :new
  end
end

def destroy
  session.destroy
  redirect_to root_path, notice: "You are successfully signed out! Come back soon!"
end

end
