class Spree::Recommendation < ActiveRecord::Base
  belongs_to :product
  belongs_to :recommended_product, :class_name => "Product"
end
