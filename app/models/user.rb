class User < ActiveRecord::Base
  has_many :carts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def current_cart=(cart)
      raise "argument must be an instance of Cart" if cart.class != Cart
      @current_cart = cart
  end

  def current_cart
    @current_cart
  end

end
