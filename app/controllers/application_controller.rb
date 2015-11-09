class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  helper_method :current_order

    #def current_order
      #session.clear
      #if !session[:order_id].nil?
        #Order.find(session[:order_id])
      #else
       # Order.new
      #end
    #end
    
    def current_order
      if !current_user.order.nil?
        Order.find_by_user_id(current_user.id)
      else
        Order.new
      end
    end
    
end
