class LineItemsController < ApplicationController
    
    def create
        cart = current_user.current_cart
        if cart.nil?
            binding.pry
        end
        binding.pry
        cart.add_item(params[:item_id])
        #cart is not adding line items.... WTF.
        cart.save
        redirect_to cart
    end

end
