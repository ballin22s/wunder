class Product < ActiveRecord::Base
  
  validates :title,  presence: true, length: { maximum: 50 }
  validates :price,  presence: true
  validates :release_year,  presence: true
  
end
