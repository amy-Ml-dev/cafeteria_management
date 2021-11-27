class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in
  before_action :vars

  def vars
    if @current_user == nil
      @current_user = current_user
    end
    if @current_user
      @current_order = @current_user.orders.find_by(status: "shopping_cart")
      if (@current_order == nil)
        @current_order = Order.new_order(@current_user.id)
      end
    end
  end

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end

  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
end
