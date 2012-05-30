class Spree::Admin::RecommendationsController < Spree::Admin::ResourceController
  before_filter :load_data
  
  def index ; end
  
  def search 
    if params[:q].blank?
      @available_recommendations = []
    else
      products_by_name = Spree::Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
      products_by_sku = Spree::Product.ransack("variants_including_master_sku_cont" => params[:q]).result
      @available_recommendations = (products_by_name + products_by_sku).uniq
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

  def add 
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
