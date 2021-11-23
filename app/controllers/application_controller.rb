class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :ensure_user_logged_in
  helper_method :is_owner?, :is_customer?, :is_clerk?, :current_user

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

  def is_owner?
    current_user && current_user.role == "Owner"
  end

  def is_clerk?
    current_user && current_user.role == "Billing Clerk"
  end

  def is_customer?
    current_user && current_user.role == "Customer"
  end

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end

  def ensure_owner
    unless current_user && is_owner?
      flash[:error] = "Access Denied!. You are not owner"
      redirect_to "/"
    end
  end

  def ensure_owner_or_clerk
    unless is_owner? || is_clerk?
      flash[:error] = "Access Denied!. You are not owner or clerk"
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
