Spree::Product.class_eval do
  has_many :recommendations, :dependent => :destroy

  after_save :cleanup_recommendations


  private
    ## If this product is deleted, remove any recommendations that have it as the recommended
    ## product
    def cleanup_recommendations
      if deleted?
        Spree::Recommendation.where(:recommended_product_id => self.id).destroy_all
      end
    end
end
