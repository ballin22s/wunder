class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :order_status
  
  has_many :order_items
  
  attr_accessor :stripe_card_token
  
  before_create :set_order_status
  
  def save_with_payment(total)
    if valid?
      save_with_stripe_payment(total)
    end
  end
  
  def save_with_stripe_payment(amount)
    @amount = (amount*100).round
    
    # if self.user.stripe_customer_token != nil
    #       customer = Stripe::Customer.retrieve(self.user.stripe_customer_token)
    #       customer.subscriptions.create(:plan => "4")
    #       self.name = self.user.billing_account.name
    #       self.email = customer.email
    #       self.card_name = customer.cards.data.first["type"]
    #       self.exp_month = customer.cards.data.first["exp_month"]
    #       self.exp_year = customer.cards.data.first["exp_year"]
    #       self.last_4_digits = customer.cards.data.first["last4"]
    #       
    #       update_to_subscribed_user
    #       
    #       save!
    #     else
      customer = Stripe::Customer.create(card: stripe_card_token, email: self.user.email)
      
      #Create Subscription
      #self.email = customer.email
      #self.name = customer.cards.data.first["name"]
      #self.card_name = customer.cards.data.first["type"]
      #self.exp_month = customer.cards.data.first["exp_month"]
      #self.exp_year = customer.cards.data.first["exp_year"]
      #self.last_4_digits = customer.cards.data.first["last4"]
      
      customer_stripe_token = customer.id
      card_token = customer.cards.data.first["id"]
      
      ###Store Tokens in User Table    
      #user_save_stripe_tokens(stripe_customer_token, card_token)
      
      charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => @amount,
          :description => 'Wunder Stripe customer',
          :currency    => 'usd'
      )
      
      self.subtotal = amount
      
      save!
    #end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
  private

    def set_order_status
      self.order_status_id = 1
    end
  
end
