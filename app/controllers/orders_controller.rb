class OrdersController < ApplicationController
  def index
    @orders = Order.placed_orders(@current_user.id)
    render "index"
  end

  def show
    @orders = Order.where(id: params[:id])
  end

  def create
    order_type = "walk-in"
    if @current_user.role == "customer"
      order_type = "online"
    end
    @current_order.update!(total_price: params[:total_price].to_f,
                           status: "placed", ordered_at: DateTime.now, order_type: order_type)
    redirect_to order_path(@current_order.id)
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.delivered_at = DateTime.now
    order.status = "delivered"
    order.save!
    redirect_to pending_orders_path
  end

  def cart
    order_item = OrderItem.exist?(@current_user.id, @current_order.id, params[:menu_item_id])
    if order_item
      updated_quantity = order_item.quantity + params[:quantity].to_i
      order_item.update!(quantity: updated_quantity,
                         price: updated_quantity * params[:item_price].to_f)
    else
      order_item = OrderItem.new(
        order_id: @current_order.id,
        menu_item_id: params[:menu_item_id],
        menu_item_name: params[:item_name],
        menu_item_price: params[:item_price],
        quantity: params[:quantity],
        price: params[:quantity].to_f * params[:item_price].to_f,
      )
      if (order_item.save)
        # do nothing
      else
        flash[:error] = order_item.errors.full_messages.join(",")
      end
    end
    redirect_to menu_path(params[:menu_id])
  end

  def pending
    @orders = Order.pending_orders?
    render "pending"
  end
end
