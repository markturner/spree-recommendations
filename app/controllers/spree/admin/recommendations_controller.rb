class Spree::Admin::RecommendationsController < Spree::Admin::ResourceController
  before_filter :load_data
  
  def selected ; end
  
  def available
    if params[:q].blank?
      @available_recommendations = []
    else
      @available_recommendations = Spree::Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @available_recommendations.delete_if { |recommendation| @product.recommendations.where(:recommended_product_id => recommendation.id).size > 0 || recommendation == @product }
    respond_to do |format|
      format.html { render :layout => false}
      format.js {render :layout => false}
    end

  end
 
  def remove
    recommendation = Spree::Recommendation.find(params[:recommendation_id]) 
    recommendation.destroy
    render :layout => false
  end  

  def select
    recommended_product = Spree::Product.find(params[:recommended_id])
    if recommended_product
      recommendation = @product.recommendations.new
      recommendation.recommended_product_id = recommended_product.id
      recommendation.save
    end
    respond_to do |format|
      format.html { render :layout => false}
      format.js {render :layout => false}
    end
  end

  private
  def load_data
    @product = Spree::Product.find_by_permalink(params[:product_id])
  end
end
