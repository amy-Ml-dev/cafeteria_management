class MenuItemsController < ApplicationController
  def index
  end

  def create
    id = params[:menu_id]
    item_name = params[:menu_item_name]
    item_price = params[:menu_item_price]
    new_menu_item = MenuItem.new(menu_id: id, menu_item_name: item_name, menu_item_price: item_price)
    if new_menu_item.save
      redirect_to menu_item_path(id)
    else
      flash[:error] = new_menu_item.errors.full_messages.join(",")
      redirect_to menu_item_path(id)
    end
  end

  def edit
    session[:edit_menu_item_id] = params[:id]
    redirect_to menu_item_path(params[:menu_id])
  end

  def show
    @menu_id = params[:id]
    @menu_items = Menu.find(@menu_id).menu_items
    render "show"
  end

  def destroy
    id = params[:id]
    menu_id = MenuItem.find(id).menu_id
    MenuItem.find(id).destroy
    redirect_to menu_item_path(params[:menu_id])
  end

  def edit_menu_item_details
    id = params[:menu_item_id]
    new_name = params[:menu_item_name]
    new_price = params[:menu_item_price]
    menu_item = MenuItem.find(id)
    menu_item.menu_item_name = new_name
    menu_item.menu_item_price = new_price
    if menu_item.save
      session[:edit_menu_item_id] = -1
    else
      flash[:error] = menu_item.errors.full_messages.join(",")
    end
    redirect_to menu_item_path(params[:menu_id])
  end
end
