class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "users/index"
  end

  def new
    render "users/new"
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    role = params[:role]
    email = params[:email]
    password = params[:password]
    new_user = User.new(
      first_name: first_name,
      last_name: last_name,
      role: role,
      email: email,
      password: password,
    )
    if new_user.save
      if role == "Owner"
        redirect_to "/users"
      else
        session[:current_user_id] = new_user.id
        @current_user = current_user
        flash[:success] = "Succesfully Logged-In :)"
        redirect_to "/"
      end
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def destroy
    user_id = params[:id]
    User.find(user_id).destroy
    redirect_to "/users"
  end
end
