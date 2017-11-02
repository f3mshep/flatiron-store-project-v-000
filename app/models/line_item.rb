class LineItem < ActiveRecord::Base
    belongs_to :item
    belongs_to :cart

    def item_inventory
        item.inventory
    end

    def item_inventory=(value)
        item.update(inventory: value)
        item_inventory
    end

end
