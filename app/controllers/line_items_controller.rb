class LineItemsController < ApplicationController
  before_action :authenticate_user! 
    
  def create 
    if current_user.current_cart.nil?
      current_user.current_cart = current_user.carts.create 
      current_user.save 
    end
    
    @item = Item.find_by(id: params[:item_id])
    current_user.current_cart.add_item(@item.id).save
    
    redirect_to cart_path(current_user.current_cart)
  end
  
end
