class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  helper_method :current_cart

    #def current_order
      #session.clear
      #if !session[:order_id].nil?
        #Order.find(session[:order_id])
      #else
       # Order.new
      #end
    #end
    
    def current_cart  
      if !current_user.cart.nil?        
        Cart.find_by_user_id(current_user.id)        
      else
        Cart.new
      end
    end
    
end
