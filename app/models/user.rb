class User < ActiveRecord::Base
  has_many :carts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def current_cart=(value)
    if value.nil?
      #this is because of one test. Would like to stick checkout_cart here.
      self.update(current_cart_id: nil)
      current_cart
    else
      self.update(current_cart_id: value.id)
      cart = Cart.find(current_cart_id)
      cart.current_user = self
      cart.save
      cart
    end
  end

  def checkout_cart
    current_cart.update(current_user: nil)
    self.update(current_cart_id: nil)
  end

  def current_cart
    Cart.find_by(id: current_cart_id)
  end

end
