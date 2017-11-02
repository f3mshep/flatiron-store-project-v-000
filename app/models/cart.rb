class Cart < ActiveRecord::Base
    belongs_to :current_user, class_name: 'User', foreign_key: 'user_id'
    has_many :line_items
    has_many :items, through: :line_items

    def total
        total_price = 0
        items.each {|item|total_price += item.price}
        total_price
    end




    def add_item(item)
        old_line_item = LineItem.find_by(cart_id: self.id, item_id: item)
        if old_line_item
            old_line_item.quantity += 1
            old_line_item
        else
            LineItem.new(cart_id: id, item_id: item)
        end
    end

end
