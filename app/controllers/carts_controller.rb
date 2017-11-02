class CartsController < ApplicationController

    def show
        binding.pry
        @current_cart = Cart.find(params[:id])
    end

end
