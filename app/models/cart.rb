class Cart < ActiveRecord::Base
  
  #Relationships
  belongs_to :user
  has_many :cart_items
  
  #Callbacks
  before_save :update_subtotal
  
  #Validations
  validates :user_id, presence: true
  
  #Calculate Cart Subtotal
  def subtotal
    cart_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  
  private
  
    #Update Cart Subtotal
    def update_subtotal
      self.subtotal = subtotal
    end
  
end
