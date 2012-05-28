Spree::Product.class_eval do
  has_and_belongs_to_many :recommendations, :class_name => "Product", :join_table => "recommendations" , :association_foreign_key => "recommendation_product_id"
end
