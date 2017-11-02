class LineItemsController < ApplicationController
    
    def create
        cart = current_user.current_cart
        if cart.nil?
            cart = current_user.current_cart = Cart.create
        end
        #if it was up to me and not the tests I would have add_item add the line items to the cart,
        #it looks clunky to have to add it using the shovel operator
        cart.line_items << cart.add_item(params[:item_id])
        cart.save
        redirect_to cart
    end

end
