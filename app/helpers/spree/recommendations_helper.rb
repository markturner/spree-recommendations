module Spree::RecommendationsHelper

  # grab a random list of recommendations, augmented with (different) products from the same taxon
  # NOTE: products doesn't return products from children; but wait now for PGs
  def random_recommendations(product, count = 0)
    if count > 0
      recs = product.recommendations.map{|r| r.recommended_product }.take(count)
    else
      recs = product.recommendations.map{|r| r.recommended_product }
    end
  end

  def random_cart_recommendations
    recs = @order.line_items.collect do |line_item|
      random_recommendations(line_item.product, 3)
    end
    recs.flatten.uniq
  end

end
