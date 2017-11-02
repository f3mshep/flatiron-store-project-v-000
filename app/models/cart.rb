class Cart < ActiveRecord::Base
    belongs_to :current_user, class_name: 'User', foreign_key: 'user_id'
    has_many :line_items
    has_many :items, through: :line_items

    def total
        total_price = 0
        line_items.each {|line_item|total_price += (line_item.item.price * line_item.quantity)}
        total_price
    end

    def checkout
        line_items.each do |line_item|
            line_item.item_inventory = line_item.item_inventory - line_item.quantity
            line_item.item.save
        end
        self.update(status: "complete" )
        current_user.checkout_cart
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
