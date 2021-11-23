class MenusController < ApplicationController
  def index
    @current_user = current_user
    @menus = Menu.active
    render "index"
  end

  def new
    render "new"
  end

  def show
    @current_user = current_user
    render "show"
  end

  def create
    name = params[:name]
    new_menu = Menu.new(name: name, active: false)
    if new_menu.save
      redirect_to new_menu_path
    else
      flash[:error] = new_menu.errors.full_messages.join(",")
      redirect_to new_menu_path
    end
  end

  def destroy
    id = params[:id]
    Menu.find(id).destroy
    redirect_to new_menu_path
  end

  def edit
    id = params[:id]
    session[:edit_menu_id] = id
    redirect_to new_menu_path
  end

  def update
    id = params[:id]
    menu = Menu.find(id)
    menu.active = !menu.active
    menu.save!
    redirect_to new_menu_path
  end

  def edit_menu_details
    id = params[:id]
    new_name = params[:name]
    menu = Menu.find(id)
    menu.name = new_name
    if menu.save
      session[:edit_menu_id] = -1
    else
      flash[:error] = menu.errors.full_messages.join(",")
    end
    redirect_to new_menu_path
  end
end
