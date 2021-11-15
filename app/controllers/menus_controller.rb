class MenusController < ApplicationController
  #before_action :ensure_user_logged_in
  #before_action :ensure_user_is_owner

  def new
    "/menus/new"
  end

  def index
    @menus = Menu.all
    render "/menus/index"
  end

  def show
    @menu = Menu.find_by_id(params[:id])
    @menu_items = MenuItem.where(menu_id: params[:id])
    render "/menus/show"
  end

  def create
    name = params[:name]
    new_menu = Menu.new(name: name)
    if new_menu.save
      redirect_to "/menus"
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to new_menu_path
    end
  end
end
