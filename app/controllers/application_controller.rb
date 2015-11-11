class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  #Fine or Create Current User Cart
  helper_method :current_cart
    
    def current_cart  
      if !current_user.cart.nil?        
        Cart.find_by_user_id(current_user.id)        
      else
        Cart.new
      end
    end
    
end
