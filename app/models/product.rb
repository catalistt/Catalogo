class Product < ApplicationRecord
  belongs_to :itemizable, polymorphic: true
  
end

