class CartsController < ApplicationController
  def index
    @cart = Cart.find_by_id(params[:id])
  end

  def new
    @cart = Cart.new(params[:user_id])
  end

  def create
    @cart = Cart.create(params[:user_id])
  end

  def show
    @cart = Cart.find_by_id(current_user.current_cart_id)
    current_user.save
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.check_out
    redirect_to cart_path(@cart)
  end
end
