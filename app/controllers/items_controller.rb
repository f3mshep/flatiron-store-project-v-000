class ItemsController < ApplicationController
    
    def show
        item_setter
    end

    def index
        @items = Item.available_items
    end

    private 
    
    def item_setter
        @item = Item.find(params[:id])
    end

    def item_params
    end

end
