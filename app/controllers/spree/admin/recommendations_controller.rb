class Spree::Admin::RecommendationsController < Spree::Admin::ResourceController
  before_filter :load_data, :only => [:selected, :available, :remove]
  
  def selected
    @recommendations = @product.recommendations
  end
  
  def available
    if params[:q].blank?
      @available_recommendations = []
    else
      @available_recommendations = Spree::Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @available_recommendations.delete_if { |recommendation| @product.recommendations.include?(recommendation) }
    respond_to do |format|
      format.html { render :layout => false}
      format.js {render :layout => false}
    end

  end
 
  
  def remove
    @product.recommendations.delete(@recommendation)
    @product.save
    @recommendations = @product.recommendations
    render :layout => false
  end  
  
  def select
    recommendation = Spree::Product.find_by_permalink(params[:id])
    @product.recommendations << recommendation
    @product.save
    @recommendations = @product.recommendations
    render :layout => false
  end

  private
  def load_data
    @product = Spree::Product.find_by_permalink(params[:product_id])
  end
end
