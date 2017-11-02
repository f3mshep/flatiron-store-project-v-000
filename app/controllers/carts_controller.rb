class CartsController < ApplicationController

    def show
        cart_setter
        @current_cart = nil if @current_cart.status == "complete"
    end

    def checkout
        cart_setter
        @current_cart.checkout
        flash[:alert] = "Your order has been processed successfully"
        redirect_to @current_cart
    end

    private

    def cart_setter(in_progress=true)
        @current_cart = Cart.find(params[:id])
    end
end
