class Order < ActiveRecord::Base
  
  #Relationships
  belongs_to :user
  belongs_to :order_status
  has_many :order_items
  
  attr_accessor :stripe_card_token
  
  #Callbacks
  before_create :set_order_status
  
  #Validations
  validates :user_id, presence: true
  validates :order_status_id, presence: true
  
  #Save With Payment If Valid
  def save_with_payment(total)
    if valid?
      save_with_stripe_payment(total)
    end
  end
  
  #Create/Save Stripe Payment
  def save_with_stripe_payment(amount)
    @amount = (amount*100).round
    
    customer = Stripe::Customer.create(card: stripe_card_token, email: self.user.email)
      
    customer_stripe_token = customer.id
    #card_token = customer.cards.data.first["id"]
          
    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Wunder Stripe customer',
        :currency    => 'usd'
    )
    
    self.subtotal = amount
    
    save!
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
  private

    #Set Order Status
    def set_order_status
      self.order_status_id = 1
    end
  
end
